//
//  ViewController.swift
//  BullsEye
//
//  Created by Gustavo Araújo on 21/05/2018.
//  Copyright © 2018 Gustavo Araújo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }

    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Alert",
                                      message: "This is an alert.\nThe slider value is: \(currentValue).",
                                       preferredStyle: .alert)
        let action = UIAlertAction(title: "Nice",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

