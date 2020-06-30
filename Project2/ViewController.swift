//
//  ViewController.swift
//  Project2
//
//  Created by jc on 2020-06-20.
//  Copyright © 2020 J. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreDisplay: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet var highestScoreLabel: UILabel!
    @IBOutlet var alert: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var numOfQuestionsAsked = 0
    var highestScore: Int = 0
    var buttonAnimation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        let defaults = UserDefaults.standard
        highestScoreLabel.text = String(defaults.integer(forKey: "highestScore"))
        highestScore = defaults.integer(forKey: "highestScore")
        
        askQuestions()
    }
    
    func askQuestions(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 1...2)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries[correctAnswer].uppercased()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            buttonAnimation = button1
        case 1:
            buttonAnimation = button2
        case 2:
            buttonAnimation = button3
        default:
            break
        }
        
        UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
            self.buttonAnimation.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        }) { (_) in
            UIView.animate(withDuration: 0.3) {
                self.buttonAnimation.transform = CGAffineTransform.identity
            }
        }
        
        if correctAnswer == sender.tag {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong!"
            score -= 1
        }
        scoreDisplay.text = String(score)
        if score > highestScore {
            alert.text = "You set the record!"
            highestScoreLabel.text = String(score)
            let defaults = UserDefaults.standard
            defaults.set(score, forKey: "highestScore")
        }
        numOfQuestionsAsked += 1
        level.text = String(numOfQuestionsAsked)
        
        let ac: UIAlertController
        if numOfQuestionsAsked == 10 {
            ac = UIAlertController(title: title, message: "Your final score is \(score)", preferredStyle: .alert)
            
            score = 0
            numOfQuestionsAsked = 0
            
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: askQuestions))
        } else {
            ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
            
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
        }
        present(ac, animated: true)
    }
}

