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
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    
    //variables and constants
    var currentValue: Int = 0 //This variable isn't neccecery anymore, but swift provide us to write in a good style
    var targetValue = 0
    var score = 0
    var round = 0
    

    override func viewDidLoad() {
        currentValue = 50
        super.viewDidLoad()
        startNewGame()
        //Styling the slider :) 
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }

    @IBAction func showAler(){
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        
        //added conditions to perform some "gamehints"
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if  difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close.."
        }
        score += points
        
        
        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok",
                                   style: .default,
                                   handler: { _ in self.startNewRound() })
        
        
        
        alert.addAction(action)
        //Make the alert visible
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
   
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        slider.value = Float(currentValue)
        updateLabels()
        
    }
    
    func updateLabels() {
        round += 1
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        
    }
   
}

