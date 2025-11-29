import UIKit

// MARK: - Hero Model
struct Hero: Decodable {
    let name: String
    let biography: Biography
    let powerstats: PowerStats
    let appearance: Appearance
    let images: HeroImage

    struct Biography: Decodable {
        let fullName: String
        let placeOfBirth: String
    }

    struct PowerStats: Decodable {
        let intelligence: Int
        let strength: Int
        let speed: Int
        let durability: Int
        let power: Int
        let combat: Int
    }

    struct Appearance: Decodable {
        let gender: String
        let race: String?
    }

    struct HeroImage: Decodable {
        let lg: String
    }
}

// MARK: - ViewController
class ViewController: UIViewController {

    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroNameLabel: UILabel!
    @IBOutlet private weak var heroFullNameLabel: UILabel!
    @IBOutlet private weak var heroStatsLabel: UILabel!
    @IBOutlet private weak var heroPlaceOfBirthLabel: UILabel!
    @IBOutlet private weak var heroGenderLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        heroImageView.layer.cornerRadius = 40
        heroImageView.layer.borderWidth = 3
        fetchHero(by: 1)
    }

    @IBAction func RoleHeroTapped(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    
    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)

        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard self.handleErrorIfNeeded(error: error) == false else {
                return
            }

            guard let data else { return }
            self.handleHeroData(data: data)
        }.resume()
    }

    private func handleHeroData(data: Data) {
        do {
            let hero = try JSONDecoder().decode(Hero.self, from: data)
            let heroImage = self.getImageFromUrl(string: hero.images.lg)

            DispatchQueue.main.async {
                self.updateUI(with: hero, image: heroImage)
            }
        } catch {
            DispatchQueue.main.async {
                self.heroNameLabel.text = "Error: \(error.localizedDescription)"
                print(error.localizedDescription)
                self.heroFullNameLabel.text = "Please try again!"
                self.heroImageView.image = nil
                self.heroStatsLabel.text = ""
                self.heroPlaceOfBirthLabel.text = ""
                self.heroGenderLabel.text = ""
            }
        }
    }

    private func updateUI(with hero: Hero, image: UIImage?) {
        heroNameLabel.text = "Name: \(hero.name)"
        heroFullNameLabel.text = "Full Name: \(hero.biography.fullName)"
        heroStatsLabel.text = """
        Intelligence: \(hero.powerstats.intelligence)
        Strength: \(hero.powerstats.strength)
        Speed: \(hero.powerstats.speed)
        Durability: \(hero.powerstats.durability)
        Power: \(hero.powerstats.power)
        Combat: \(hero.powerstats.combat)
        """
        heroPlaceOfBirthLabel.text = "Place of Birth: \(hero.biography.placeOfBirth)"
        heroGenderLabel.text = "Gender: \(hero.appearance.gender)"
        heroImageView.image = image
    }

    private func getImageFromUrl(string: String) -> UIImage? {
        guard
            let heroImageURL = URL(string: string),
            let imageData = try? Data(contentsOf: heroImageURL)
        else {
            return nil
        }
        return UIImage(data: imageData)
    }

    private func handleErrorIfNeeded(error: Error?) -> Bool {
        guard let error else {
            return false
        }
        print(error.localizedDescription)
        return true
    }
}
