//
//  ViewController.swift
//  BullsEye
//
//  Created by Gustavo Araújo on 21/05/2018.
//  Copyright © 2018 Gustavo Araújo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = lroundf(slider.value)
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        var difference = currentValue - targetValue
        if difference < 0 {
            difference = -difference
        }
        
        let message = "The value of the slider is: \(currentValue)\n"
                    + "The target value is \(targetValue)\n"
                    + "The difference is \(difference)"
        let alert = UIAlertController(title: "Alert",
                                      message: message,
                                       preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }

}

