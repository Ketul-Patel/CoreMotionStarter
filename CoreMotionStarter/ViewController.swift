//
//  ViewController.swift
//  CoreMotionStarter
//
//  Created by Ketul Patel on 6/10/15.
//  Copyright (c) 2015 Ketul Patel. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    // step count outlet
    
    @IBOutlet weak var stepCount: UILabel!
    // reset button
    @IBAction func resetButtonPressed(sender: UIButton) {
        pedometer.stopPedometerUpdates()
        stepCount.text = "0"
    }
    // start button
    @IBAction func startButtonPressed(sender: UIButton) {
        pedometer.startPedometerUpdatesFromDate(NSDate(), withHandler: { data, error in
            print("Update \(data.numberOfSteps)")
            dispatch_async(dispatch_get_main_queue()) {
                self.stepCount.text = String(stringInterpolationSegment: data.numberOfSteps)
            }
        })
    }
    let pedometer: CMPedometer = CMPedometer()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

