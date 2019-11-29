//
//  ViewController.swift
//  rayGame
//
//  Created by Ishaq on 28/11/2019.
//  Copyright © 2019 Ishaq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var currentRound = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var target: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var round: UILabel!
    
    
    @IBAction func showAlert() {
        
//        var difference = currentValue - targetValue
//        if difference < 0 {
//        difference = difference * -1
//        }
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
    
        let title: String
        
        if difference == 0{
            title = "Perfect 100 bonus points for you!"
            points += 100
        } else if difference < 1 {
            title = "Damn, close have 50 bonus points!"
            points += 50
        } else if difference < 5 {
            title = "So close!"
        } else {
            title = "Nowhere near..."
        }
        
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert,animated: true, completion: nil)
        
    }
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        score = 0
        currentRound = 0
        startNewRound()
    }
    
    
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(slider.value)
    }
    
    func roundCounter () {
       currentRound += 1
    }
    
    
    func startNewRound() {
           targetValue = Int.random(in: 1...100)
           currentValue = 50
           slider.value = Float(currentValue)
           roundCounter()
           updateLabels()
       }
    
    override func viewDidLoad() {
          super.viewDidLoad()
          let roundedValue = slider.value.rounded()
          currentValue = Int(slider.value)
          startNewRound()
        
        let thumbImageNormal = #imageLiteral(resourceName: "johnsonxs5.png")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = #imageLiteral(resourceName: "johnsonxs5.png")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
       
          // Do any additional setup after loading the view.
      }
    func updateLabels () {
        target.text = String(targetValue)
        userScore.text = String(score)
        round.text = String(currentRound)
    }
    

    }
    

    

