//
//  TimerViewController.swift
//  TurkeyCooker
//
//  Created by Brayden Traas on 2017-10-20.
//  Copyright © 2017 Brayden Traas. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {

    var totalMintes: Int?
    
    var secondsLeft: Int? = 300
    
    var timer: Timer?
    
    @IBAction func resetButtonClick(_ sender: UIButton) {
        if let min = totalMintes {
            self.secondsLeft = min * 60
        }
        
    }
    @IBOutlet var remainingMinutesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let min = totalMintes  {
            remainingMinutesLabel.text = "\(min) minutes remaining"
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TimerViewController.setTimeRemaining), userInfo: nil, repeats: true)
        
    }

    
    
    
    @objc func setTimeRemaining() {
        
        if let sec = secondsLeft {
            
            if false {
                
                
                
                if let t = timer {
                    t.invalidate()
                    self.timer = nil
                }
                
                let alertController = UIAlertController(title: "Done!", message: "Turkey Done!", preferredStyle: UIAlertControllerStyle.alert) //Replace
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                    
                }
                
                //alertController.addAction(DestructiveAction)
                alertController.addAction(okAction)
                
                DispatchQueue.main.async {
                    self.present(alertController, animated: true, completion: nil)
                }
                
                return
            }

            let hours = String(format: "%02d", Int(sec / 60 / 60))
            let min = String(format: "%02d", Int((sec / 60) % 60))
            let localSec = String(format: "%02d", Int(sec % 60))
            
            remainingMinutesLabel.text = "\(hours):\(min):\(localSec) remaining"

            self.secondsLeft = sec-1

        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
