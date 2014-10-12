//
//  HomeViewController.swift
//  tumblr-mockup
//
//  Created by Henry Freel on 10/9/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var signedInHomeImageView: UIImageView!

    
    var defaults = NSUserDefaults.standardUserDefaults()
    
    var isPresenting: Bool = true
    var loginViewController : UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        defaults.setInteger(0, forKey: "logged-in")
        defaults.synchronize()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        loginViewController = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as UIViewController

        // Do any additional setup after loading the view.
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
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            
            let vc = toViewController as LoginViewController
            
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 1
            toViewController.view.backgroundColor = UIColor(red: 0.19, green: 0.26, blue: 0.35, alpha: 0)
            vc.loginForm.transform = CGAffineTransformMakeTranslation(0, 350)
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                vc.loginForm.transform = CGAffineTransformMakeTranslation(0, 0)
                
                }) { (finished: Bool) -> Void in
                    
                    transitionContext.completeTransition(true)
                    
            }
            
        } else {
            
            let vc = fromViewController as LoginViewController
            
            var initalVal = self.defaults.integerForKey("logged-in")
            println("this is the thing \(initalVal)")
            
            if initalVal == 1 {
                
                println("fuck yea")
                signedInHomeImageView.hidden = false
                
            }

            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                
                vc.loginForm.transform = CGAffineTransformMakeTranslation(0, 400)
                vc.view.endEditing(true)
                
                }) { (finished: Bool) -> Void in
                    
                    fromViewController.view.alpha = 0
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
                    
            }
            
        }
        
    }


}
