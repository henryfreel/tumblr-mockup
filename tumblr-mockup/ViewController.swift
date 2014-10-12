//
//  ViewController.swift
//  tumblr-mockup
//
//  Created by Henry Freel on 10/8/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning  {
    
    var isPresenting: Bool = true

    @IBOutlet weak var containerView: UIView!
    
    var homeViewController : UIViewController!
    var searchViewController : UIViewController!
    var composeViewController : UIViewController!
    var accountViewController : UIViewController!
    var trendingViewController : UIViewController!
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var discoverBubbleImage: UIImageView!
    
    var pressedButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton.selected = true
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as UIViewController
        
        containerView.addSubview(homeViewController.view)
        
        UIView.animateWithDuration(0.5, delay: 0, options: UIViewAnimationOptions.Autoreverse | UIViewAnimationOptions.Repeat, animations: { () -> Void in
            self.discoverBubbleImage.transform = CGAffineTransformMakeTranslation(0, -5)
            println("movin'")
        }, completion: nil)

        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressTabBarButton(sender: UIButton) {
        
        discoverBubbleImage.hidden = false
        
        pressedButton = sender as UIButton
        
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        pressedButton.selected = true
        
        var selectedButton = pressedButton
        
        switch selectedButton {
            
            case homeButton:
            
                println("Home Pressed")
                self.addChildViewController(homeViewController)
                containerView.addSubview(homeViewController.view)
                homeViewController.didMoveToParentViewController(self)
            
            case searchButton:
            
                println("Search Pressed")
                self.addChildViewController(searchViewController)
                containerView.addSubview(searchViewController.view)
                searchViewController.didMoveToParentViewController(self)
                discoverBubbleImage.hidden = true
            
            case accountButton:
            
                println("Account Pressed")
                self.addChildViewController(accountViewController)
                containerView.addSubview(accountViewController.view)
                accountViewController.didMoveToParentViewController(self)
            
            case trendingButton:
            
                println("Trending Pressed")
                self.addChildViewController(trendingViewController)
                containerView.addSubview(trendingViewController.view)
                trendingViewController.didMoveToParentViewController(self)
            
            default:
            
                println("default fired")
            
            }
        
        
    }
    
    
    
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.1
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        
        if (isPresenting) {
            println("going to")
            
            let vc = toViewController as ComposeViewController
            
            vc.textButton.transform = CGAffineTransformMakeTranslation(0, 400)
            vc.photoButton.transform = CGAffineTransformMakeTranslation(0, 400)
            vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, 400)
            vc.linkButton.transform = CGAffineTransformMakeTranslation(0, 400)
            vc.chatButton.transform = CGAffineTransformMakeTranslation(0, 400)
            vc.videoButton.transform = CGAffineTransformMakeTranslation(0, 400)


            containerView.addSubview(toViewController.view)
            
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                
                toViewController.view.alpha = 1
                toViewController.view.backgroundColor = UIColor(red: 0.19, green: 0.26, blue: 0.35, alpha: 0.8)
                
                
                }) { (finished: Bool) -> Void in
                    
                    UIView.animateWithDuration(0.5, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        vc.textButton.transform = CGAffineTransformMakeTranslation(0, 0)
                    }, completion: nil)
                    UIView.animateWithDuration(0.5, delay: 0.10, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        vc.photoButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: nil)
                    UIView.animateWithDuration(0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: nil)
                    UIView.animateWithDuration(0.5, delay: 0.20, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        vc.linkButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: nil)
                    UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        vc.chatButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: nil)
                    UIView.animateWithDuration(0.5, delay: 0.30, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                        vc.videoButton.transform = CGAffineTransformMakeTranslation(0, 0)
                        }, completion: nil)

                    
                    transitionContext.completeTransition(true)
                    
            }
            
        } else {
            println("coming back")
            
            let vc = fromViewController as ComposeViewController
            
            UIView.animateWithDuration(0.5, delay: 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.textButton.transform = CGAffineTransformMakeTranslation(0, -400)
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.10, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.photoButton.transform = CGAffineTransformMakeTranslation(0, -400)
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.15, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.quoteButton.transform = CGAffineTransformMakeTranslation(0, -400)
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.20, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.linkButton.transform = CGAffineTransformMakeTranslation(0, -400)
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.25, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.chatButton.transform = CGAffineTransformMakeTranslation(0, -400)
                }, completion: nil)
            UIView.animateWithDuration(0.5, delay: 0.30, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.videoButton.transform = CGAffineTransformMakeTranslation(0, -400)
                }, completion: nil)
            
            UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: nil, animations: { () -> Void in
                vc.nevermindButton.transform = CGAffineTransformMakeTranslation(0, 100)
            }, completion: nil)

            
            UIView.animateWithDuration(0.2, delay: 0.5, options: nil, animations: { () -> Void in
                fromViewController.view.alpha = 0

                }, completion: { (finished: Bool) -> Void in
                    fromViewController.view.alpha = 0
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()

            })
            
            
            
        }
    }


    
    
    
//last one
}

