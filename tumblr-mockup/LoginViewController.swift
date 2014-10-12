//
//  LoginViewController.swift
//  tumblr-mockup
//
//  Created by Henry Freel on 10/9/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var defaults = NSUserDefaults.standardUserDefaults()

    @IBOutlet weak var loginForm: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPressLogin(sender: UIButton) {
        
        
        var alertViewSignIn = UIAlertView(title: "Signing in...", message: nil, delegate: self, cancelButtonTitle: nil)
        alertViewSignIn.show()
        
        delay(2, closure: { () -> () in
            
        alertViewSignIn.dismissWithClickedButtonIndex(0, animated: true)
        
        if self.emailTextField.text == "" {
            
            var alertView = UIAlertView(title: "Email Required", message: "Please enter an email address", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        } else if self.passwordTextField.text == "" {
            
            var alertView = UIAlertView(title: "Password Required", message: "Please Enter a password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        } else if self.emailTextField.text == "Henry" && self.passwordTextField.text == "password" {
            
            self.defaults.setInteger(1, forKey: "logged-in")
            self.defaults.synchronize()
            self.dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            
            var alertView = UIAlertView(title: "Sign in Failed", message: "Please enter a valid emil address and password", delegate: self, cancelButtonTitle: "OK")
            alertView.show()
            
        }
        })
        
        
    }
    
    
    @IBAction func didPressCancelButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

  

}
