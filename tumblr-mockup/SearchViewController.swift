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
    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet weak var scrollview: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollview.hidden = true
        
        scrollview.contentSize = backgroundImage.image!.size
    
        var images = UIImage.animatedImageNamed("loading-", duration: 0.7)
        loadingImageView.image = images

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        delay(2, closure: { () -> () in
            self.scrollview.hidden = false
        })
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
