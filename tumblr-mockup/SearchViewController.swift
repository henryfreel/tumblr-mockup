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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImage.hidden = true
        
        
        var loaderImage: [UIImage] = [
            UIImage(named: "loading-1.png"),
            UIImage(named: "loading-2.png"),
            UIImage(named: "loading-3.png")
        ]
        
        var imageView = UIImageView(frame: CGRectMake(130, 274, loaderImage[0].size.width, loaderImage[0].size.height))
        view.addSubview(imageView)
       
        imageView.image = loaderImage[0]
        
        delay(2, closure: { () -> () in
            self.backgroundImage.hidden = false
            imageView.hidden = true
        })
        
        
        // Do any additional setup after loading the view.
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
