//
//  ComposeViewController.swift
//  Tumblr Demo
//
//  Created by Ryan Sims on 10/12/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    let buttonRowOneOriginY:CGFloat = 138
    let buttonRowTwoOriginY:CGFloat = 268
    let buttonHiddenOriginY:CGFloat = 600

    var offsetButtonArrayOne:[UIButton] = []
    var offsetButtonArrayTwo:[UIButton] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        offsetButtonArrayOne = [textButton, quoteButton]
        offsetButtonArrayTwo = [linkButton, chatButton, videoButton]

        // hide buttons in row one
        for (index, value) in enumerate(offsetButtonArrayOne) {
            var button = value
            button.frame.origin.y = buttonHiddenOriginY;
        }
        // hide buttons in row two
        for (index, value) in enumerate(offsetButtonArrayTwo) {
            var button = value
            button.frame.origin.y = buttonHiddenOriginY;
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        // show buttons in row one
        UIView.animateWithDuration(0.5){
            for (index, value) in enumerate(self.offsetButtonArrayOne) {
                var button = value
                button.frame.origin.y = self.buttonRowOneOriginY;
            }
        }
        // show buttons in row two
        delay(0.25, { () -> () in
            UIView.animateWithDuration(0.5){
                for (index, value) in enumerate(self.offsetButtonArrayTwo) {
                    var button = value
                    button.frame.origin.y = self.buttonRowTwoOriginY;
                }
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissButtonTap(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
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
