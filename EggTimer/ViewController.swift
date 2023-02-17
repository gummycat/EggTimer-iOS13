//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  let eggTimes : [String : Int] = [
    "Soft": 300,
    "Medium": 420,
    "Hard": 720
  ]
  
  var remainingSeconds = 0
  var timer = Timer()
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    guard let eggTime = eggTimes[sender.currentTitle!] else {return}
      
    timer.invalidate()
    
    remainingSeconds = eggTime
    
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
      if self.remainingSeconds > 0 {
        print ("\(self.remainingSeconds) seconds")
        self.remainingSeconds -= 1
      } else {
        Timer.invalidate()
      }
    }
  }
}
