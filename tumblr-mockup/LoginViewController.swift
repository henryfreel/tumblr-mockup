//
//  LoginViewController.swift
//  tumblr-mockup
//
//  Created by Henry Freel on 10/9/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginForm: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func didPressLogin(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func didPressCancelButton(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }

  

}
