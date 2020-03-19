//
//  TabBarViewController.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/9/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for viewController in self.viewControllers! {
            _ = viewController.view
            
        }
        
        //        let customView = UIView()
        //        customView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        //        customView.frame = CGRect.init(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: 400)
        //        customView.translatesAutoresizingMaskIntoConstraints = false
        //        let horizontalConstraint = customView.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor)
        //        let verticalConstraint = customView.centerYAnchor.constraint(equalTo: tabBar.centerYAnchor)
        //        let widthConstraint = customView.widthAnchor.constraint(equalToConstant: tabBar.bounds.width)
        //        let heightConstraint = customView.heightAnchor.constraint(equalToConstant: tabBar.bounds.height + 90)
        //        NSLayoutConstraint.activate([horizontalConstraint, verticalConstraint, widthConstraint, heightConstraint])
        //
        //        self.view.addSubview(customView)
        
//        let image = UIImage.init(named: "Group 350")
        var imageView = UIImageView()
        imageView  = UIImageView(frame: .init(x: self.view.frame.width/2-30, y: self.view.frame.maxY-100, width: 70, height: 70))
        imageView.image = UIImage(named: "Group 350")
        imageView.contentMode = .center
        
        imageView.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9675140977, blue: 0.9607843137, alpha: 1)
        imageView.layer.cornerRadius = 35
        imageView.layer.shadowColor = #colorLiteral(red: 0.07843137255, green: 0.05098039216, blue: 0.01960784314, alpha: 1)
        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        imageView.layer.shadowOpacity = 0.5
        imageView.layer.shadowRadius = 4
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = false
        self.view.addSubview(imageView)
        
    }
    
    
    
}
