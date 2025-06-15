//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var progressBar: UIProgressView!
    let hardnessTime: [String: Int] = ["Hard":12, "Medium":7, "Soft":5]
    @IBOutlet weak var timeRemain: UILabel!
    // var hardness : String?
    // this mean the hardness can have data or can be nil
    // so we can initialize the hardness for nill by var hardness : String? = nil
    // let say hardness = "hard"
    // then we print(hardness) <- this will show out "Optional("hard")"
    // so we can use unwrapped so that can see the real value by print(hardness!)
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle!
        
        var realTime = hardnessTime[hardness]!
        
        timeRemain.text = String(realTime);
        
        progressBar.progress = 1.0
        
        let minusStatus = progressBar.progress/Float(realTime)
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
                if realTime > 0 {
                    self.progressBar.progress -= Float(minusStatus)
                    realTime -= 1
                    self.timeRemain.text = String(realTime)
                } else {
                    Timer.invalidate()
                }
            }
    }
    
    

}
