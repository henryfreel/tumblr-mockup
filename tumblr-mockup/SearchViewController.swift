//
//  SearchViewController.swift
//  tumblr-mockup
//
//  Created by Henry Freel on 10/9/14.
//  Copyright (c) 2014 Henry Freel. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var loaderImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.hidden = true
        
        UIView.animateWithDuration(2, animations: { () -> Void in
            
            self.loaderImage.transform = CGAffineTransformMakeScale(5, 5)
            
            }) { (finshed: Bool) -> Void in
                
            println("Complete")
            self.backgroundImage.hidden = false
            self.loaderImage.hidden = true
        }

        // Do any additional setup after loading the view.
    }

    
}
