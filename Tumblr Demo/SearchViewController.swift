//
//  SearchViewController.swift
//  Tumblr Demo
//
//  Created by Ryan Sims on 10/12/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var searchFeedImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        var loadingImages = UIImage.animatedImageNamed("loading-", duration: 0.75)
        loadingImageView.image = loadingImages
        delay(2, { () -> () in
            self.loadingImageView.hidden = true
            self.searchFeedImageView.hidden = false
        })
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
