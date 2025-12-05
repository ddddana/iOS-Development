//
//  ViewController.swift
//  SuperHero2
//
//  Created by Бакдаулет on 05.12.2024.
//

import UIKit
import Alamofire
import Kingfisher

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

class ViewController: UIViewController {
    
    @IBOutlet private weak var heroImageView: UIImageView!
    @IBOutlet private weak var heroNameLabel: UILabel!
    @IBOutlet private weak var heroFullNameLabel: UILabel!
    @IBOutlet private weak var heroStatsLabel: UILabel!
    @IBOutlet private weak var heroPlaceOfBirthLabel: UILabel!
    @IBOutlet private weak var heroGenderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupImageView()
        fetchHero(by: 1)
    }
    
    private func setupImageView() {
        heroImageView.contentMode = .scaleAspectFill
        heroImageView.clipsToBounds = true
        heroImageView.layer.cornerRadius = 40
        heroImageView.layer.borderWidth = 3
        heroImageView.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    @IBAction func roleRandomHero(_ sender: UIButton) {
        let randomId = Int.random(in: 1...563)
        fetchHero(by: randomId)
    }
    
    private func fetchHero(by id: Int) {
        let urlString = "https://akabab.github.io/superhero-api/api/id/\(id).json"
        
        AF.request(urlString).responseDecodable(of: Hero.self) { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let hero):
                self.loadImage(from: hero.images.lg) { image in
                    DispatchQueue.main.async {
                        self.updateUI(with: hero, image: image)
                    }
                }
            case .failure(let error):
                self.handleError(error)
            }
        }
    }
    
    private func loadImage(from urlString: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        KingfisherManager.shared.retrieveImage(with: url) { result in
            switch result {
            case .success(let imageResult):
                completion(imageResult.image)
            case .failure:
                completion(nil)
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
    
    private func handleError(_ error: Error) {
        DispatchQueue.main.async {
            self.heroNameLabel.text = "Error: \(error.localizedDescription)"
            self.heroFullNameLabel.text = "Please try again!"
            self.heroImageView.image = nil
            self.heroStatsLabel.text = ""
            self.heroPlaceOfBirthLabel.text = ""
            self.heroGenderLabel.text = ""
            
            print("Fetch Error: \(error.localizedDescription)")
        }
    }
}
