import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var segmentControlButton: UISegmentedControl!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!

    var audioPlayer: AVAudioPlayer?
    var currentIndex = 0

    
    let songs: [(title: String, artist: String, file: String, cover: String)] = [
        ("Расстояние", "Ulukmanapo & Bakr", "song1", "cover1"),
        ("Таю","TASSO", "song2", "cover2"),
        ("Кино", "Macan", "song3", "cover3"),
        ("Не Сходи С Ума", "Тимати", "song4", "cover4"),
        ("Конспект", "SCIRENA", "song5", "cover5"),
    
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        songNameLabel.numberOfLines = 0
            songNameLabel.lineBreakMode = .byWordWrapping
            songNameLabel.textAlignment = .center
            songNameLabel.adjustsFontSizeToFitWidth = true
            songNameLabel.minimumScaleFactor = 0.8

            singerLabel.numberOfLines = 0
            singerLabel.lineBreakMode = .byWordWrapping
            singerLabel.textAlignment = .center
            singerLabel.adjustsFontSizeToFitWidth = true
            singerLabel.minimumScaleFactor = 0.8

            volumeSlider.value = 0.8
            volumeSlider.thumbTintColor = UIColor(white: 0.1, alpha: 0.9)
            updateUIForCurrentTrack()
            preparePlayerForCurrentIndex()
        
        
        // slider style
        volumeSlider.value = 0.8
        volumeSlider.thumbTintColor = UIColor(white: 0.1, alpha: 0.9)

        // load first track metadata (doesn't auto-play)
        updateUIForCurrentTrack()
        preparePlayerForCurrentIndex()
    }
    
    private func setBackground() {
        let bgImageView = UIImageView(frame: view.bounds)
        bgImageView.image = UIImage(named: "background")
        bgImageView.contentMode = .scaleAspectFill
        bgImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(bgImageView, at: 0)

        // Blur эффект
        let blur = UIBlurEffect(style: .systemMaterialDark)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = view.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.insertSubview(blurView, aboveSubview: bgImageView)
    }


    // Prepare / Load / Play
    private func preparePlayerForCurrentIndex() {
        guard songs.indices.contains(currentIndex) else {
            print("Index out of range:", currentIndex)
            audioPlayer = nil
            return
        }

        let fileName = songs[currentIndex].file

        // find file in bundle
        guard let path = Bundle.main.path(forResource: fileName, ofType: "mp3") else {
            print("File not found in bundle:", "\(fileName).mp3")
            audioPlayer = nil
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = volumeSlider.value
        } catch {
            print("Audio player error:", error)
            audioPlayer = nil
        }
    }

    private func playSong() {
        // ensure player is prepared for the current index
        preparePlayerForCurrentIndex()
        updateUIForCurrentTrack()

        // if segment control set to Play (index 0) — start playing
        if segmentControlButton.selectedSegmentIndex == 0 {
            audioPlayer?.play()
        }
    }

    private func updateUIForCurrentTrack() {
        guard songs.indices.contains(currentIndex) else { return }
        let t = songs[currentIndex]

        songNameLabel.text = t.title
        singerLabel.text = t.artist

        // Устанавливаем обложку
        coverImageView.image = UIImage(named: t.cover)
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            // Play
            if audioPlayer == nil {
                preparePlayerForCurrentIndex()
            }
            audioPlayer?.play()
        } else {
            // Pause/Stop
            audioPlayer?.pause()
        }
    }

    @IBAction func volumeChanged(_ sender: UISlider) {
        audioPlayer?.volume = sender.value
    }

    @IBAction func previousSong(_ sender: UIButton) {
        guard !songs.isEmpty else { return }
        currentIndex = (currentIndex - 1 + songs.count) % songs.count
        playSong()
    }

    @IBAction func nextSong(_ sender: UIButton) {
        guard !songs.isEmpty else { return }
        currentIndex = (currentIndex + 1) % songs.count
        playSong()
    }
}
