//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  
  let eggTimes : [String : Int] = [
    "Soft": 3,
    "Medium": 4,
    "Hard": 7
  ]
  
  var seconds = 1
  var eggTime = 0
  var timer = Timer()
  var audioPlayer: AVAudioPlayer?

  @IBOutlet weak var labelTop: UILabel!
  
  @IBOutlet weak var pvEggTimer: UIProgressView!
  
  @IBAction func hardnessSelected(_ sender: UIButton) {
    guard let time = eggTimes[sender.currentTitle!] else {return}
      
    timer.invalidate()
    
    self.pvEggTimer.progress = 0.0
    self.eggTime = time
    self.seconds = 1
    
    timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
      if self.seconds < self.eggTime {
        print("\(self.seconds) seconds remaining")
        print("\(self.eggTime) totalTime")
        self.pvEggTimer.progress = Float(self.seconds) / Float(self.eggTime)
        print("\(self.pvEggTimer.progress)")
        
        self.seconds += 1
      } else {
        self.labelTop.text = "Done!"
        self.pvEggTimer.progress = 1.0
        
        Timer.invalidate()
        
        if let path = Bundle.main.path(forResource: "alarm_sound", ofType: "mp3") {
            do {
              self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
              self.audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }

      }
    }
  }
}
