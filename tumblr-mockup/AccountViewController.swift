//
//  AccountViewController.swift
//  tumblr-mockup
//
//  Created by Henry Freel on 10/9/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var signedInImageView: UIImageView!
    
    var defaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        var initalVal = self.defaults.integerForKey("logged-in")
        println("this is the thing \(initalVal)")
        
        if initalVal == 1 {
            
            println("fuck yea")
            signedInImageView.hidden = false
            
        }
        

    }

}
