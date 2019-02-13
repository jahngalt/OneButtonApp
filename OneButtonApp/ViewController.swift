//
//  ViewController.swift
//  OneButtonApp
//
//  Created by Oleg Kudimov on 2/11/19.
//  Copyright © 2019 Oleg Kudimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    
    
    //variables and constants
    var currentValue: Int = 50 //This variable isn't neccecery anymore, but swift provide us to write in a good style
    var targetValue = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        
    }

    @IBAction func showAler(){
        
        let difference = abs(targetValue - currentValue)
        
        
        let message = "The value of the slider is: \(currentValue)" + "\nThe Target value is: \(targetValue)" + "\nThe difference is: \(difference)"
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
   
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels() 
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
    }
}

