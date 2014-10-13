//
//  HomeViewController.swift
//  Tumblr Demo
//
//  Created by Ryan Sims on 10/12/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var dashboardTextImageView: UIImageView!
    @IBOutlet weak var spinnerImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dashboardTextImageView.alpha = 0
        self.spinnerImageView.alpha = 1
        
        UIView.animateWithDuration(0.75, animations: { () -> Void in
//           self.spinnerImageView.transform = CGAffineTransformMakeScale(2, 2)
            self.spinnerImageView.transform = CGAffineTransformMakeRotation(CGFloat(90.0 * M_PI)/180.0)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    self.dashboardTextImageView.alpha = 1
                })
        }
        
//        delay(10, { () -> () in
//            self.spinnerImageView.hidden = true
//            self.dashboardTextImageView.hidden = false
//        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
