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
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dashboardTextImageView.alpha = 0
        self.spinnerImageView.alpha = 1
        
        UIView.animateWithDuration(0.6, animations: { () -> Void in
            self.spinnerImageView.transform = CGAffineTransformMakeRotation(CGFloat(60.0 * M_PI)/180.0)
            }) { (finished: Bool) -> Void in
                UIView.animateWithDuration(0.2, animations: { () -> Void in
                    self.dashboardTextImageView.alpha = 1
                })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTap(sender: AnyObject) {
//        self.performSegueWithIdentifier("loginSegue", sender: self)
//        parentViewController?.prepareForSegue(segue: "loginSegue", sender: AnyObject?)
        println(parentViewController);
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
