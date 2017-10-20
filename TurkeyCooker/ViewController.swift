//
//  ViewController.swift
//  TurkeyCooker
//
//  Created by Brayden Traas on 2017-10-20.
//  Copyright © 2017 Brayden Traas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var minutes: Int?
    
    @IBOutlet var sizeInput: UITextField!
    
    @IBOutlet var unitsControl: UISegmentedControl!
    
    @IBOutlet var stuffingSwitch: UISwitch!
    
    @IBOutlet var resultLabel: UILabel!
    @IBAction func goClick(_ sender: UIButton) {
        
        guard let weightString = sizeInput.text, let weightOrig = Double(weightString) else {
            let alertController = UIAlertController(title: "Error", message: "Invalid Number", preferredStyle: UIAlertControllerStyle.alert) //Replace
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

        
        let weightLB = unitsControl.selectedSegmentIndex == 0 ? weightOrig : 2.20462 * weightOrig
        
        let minutesTotal = stuffingSwitch.isOn ? Int(round(weightLB * 8 ) + 145) : Int(round(weightLB * 8) + 100 )
        
//        if !stuffingSwitch.isOn {e
//
//            let minutesTotal =
//            //resultLabel.text = String() + " minutes"
//        } else {
//            let minutesTotal =
//            //resultLabel.text = String(Int(round(weightLB * 9 ) + 45 )) + " minutes"
//        }
//
        print("minutesTotal: \(minutesTotal)")
        
        let hours = Int(minutesTotal / 60)
        let minutes = Int(minutesTotal % 60)
        
        resultLabel.text = "\(hours) hours \(minutes) minutes"
        
        self.minutes = minutesTotal
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if let controller = segue.destination as? TimerViewController {
            
            if let min = minutes {
                controller.totalMintes = minutes
                controller.secondsLeft = min * 60
            }
        }
        
        // note this doesn't work. it should reference a segue id not a viewcontroller id.
        //        if segue.identifier == "store-details-view-controller" {
        //            let controller = segue.destination as! DetailsViewController
        //            controller.custNo = self.custNo
        //            print("set controller custNo to \(controller.custNo)")
        //
        //            //DispatchQueue.main.async {
        //
        //            //}
        //
        //        }
        
    }


}

