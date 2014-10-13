//
//  TabBarViewController.swift
//  Tumblr Demo
//
//  Created by Ryan Sims on 10/12/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    @IBOutlet weak var contentView: UIScrollView!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // setup storyboard
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // setup our main view
        contentView.contentSize = CGSize(width: contentView.frame.width, height: contentView.frame.height)
        
        // setup our children views
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController

        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        self.homeButtonTap(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func homeButtonTap(sender: AnyObject) {
        activateTabBarButton(homeButton)

        contentView.addSubview(homeViewController.view)
        self.addChildViewController(homeViewController)
        homeViewController.view.frame.origin = CGPoint(x: 0,y: 0)
        homeViewController.didMoveToParentViewController(self)
    }

    @IBAction func searchButtonTap(sender: AnyObject) {
        activateTabBarButton(searchButton)
        
        contentView.addSubview(searchViewController.view)
        self.addChildViewController(searchViewController)
        searchViewController.view.frame.origin = CGPoint(x: 0,y: 0)
        searchViewController.didMoveToParentViewController(self)

    }
    
    @IBAction func composeButtonTap(sender: AnyObject) {
        self.performSegueWithIdentifier("composeSegue", sender: self)
    }

    
    @IBAction func accountButtonTap(sender: AnyObject) {
        activateTabBarButton(accountButton)
        
        contentView.addSubview(accountViewController.view)
        self.addChildViewController(accountViewController)
        accountViewController.view.frame.origin = CGPoint(x: 0,y: 0)
        accountViewController.didMoveToParentViewController(self)
        
    }
    
    @IBAction func trendingButtonTap(sender: AnyObject) {
        activateTabBarButton(trendingButton)
        
        contentView.addSubview(trendingViewController.view)
        self.addChildViewController(trendingViewController)
        trendingViewController.view.frame.origin = CGPoint(x: 0,y: 0)
        trendingViewController.didMoveToParentViewController(self)
        
    }
    
    func activateTabBarButton(activeButton: UIButton) {
        var buttonArray:[UIButton] = [homeButton, searchButton, composeButton, accountButton, trendingButton]
        
        for (index, value) in enumerate(buttonArray) {
            var button = value
            button.selected = false
        }

        var selectedButton: UIButton = activeButton
        selectedButton.selected = true
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
