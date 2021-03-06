//
//  ViewController.swift
//  BullsEye
//
//  Created by Gustavo Araújo on 21/05/2018.
//  Copyright © 2018 Gustavo Araújo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlited = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        round += 1
        
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    @IBAction func startNewGame() {
        round = 0
        score = 0
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        let title: String
        let message: String
        let alert: UIAlertController
        let action: UIAlertAction
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference < 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        message = "You scored \(points) points."
        
        alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
        
        action = UIAlertAction(title: "Nice",
                                style: .default,
                                handler: { action in self.startNewRound() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

