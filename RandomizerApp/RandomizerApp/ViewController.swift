//
//  ViewController.swift
//  RandomizerApp
//
//  Created by Дана Рашид on 23.10.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    let items = [
          ("Rose 🌹", "flower1"),
          ("Tulip 🌷", "flower2"),
          ("Sunflower 🌻", "flower3"),
          ("Lily 🌼", "flower4"),
          ("Daisy 🌸", "flower5"),
          ("Orchid 💮", "flower6"),
          ("Lavender 💜", "flower7"),
          ("Peony 🌺", "flower8"),
          ("Cherry Blossom 🌸", "flower9"),
          ("Bluebell 🔵", "flower10")
      ]
    
    @IBAction func randomizeButtonPressed(_ sender: UIButton) {
        let randomItem = items.randomElement()!
        titleLabel.text = randomItem.0
        imageView.image = UIImage(named: randomItem.1)
            }
        }
    
