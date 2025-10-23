//
//  ViewController.swift
//  DiceeApp
//
//  Created by Дана Рашид on 21.10.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftDiceImageView: UIImageView!
    @IBOutlet weak var rightDiceImageView: UIImageView!
    
    @IBAction func rollButtonPressed(_ sender: UIButton) {
        let dice = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
        leftDiceImageView.image = UIImage(named: dice.randomElement()!)
        rightDiceImageView.image = UIImage(named: dice.randomElement()!)
    }
}

