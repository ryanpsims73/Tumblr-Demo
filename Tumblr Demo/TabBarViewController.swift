//
//  TabBarViewController.swift
//  Tumblr Demo
//
//  Created by Ryan Sims on 10/12/14.
//  Copyright (c) 2014 Ryan Sims. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true

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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }

    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
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
