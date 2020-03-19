//
//  FirstCollectionViewCell.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/11/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myImage.layer.cornerRadius = 10
        
        //        let imageView = UIView()
        //        imageView.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        //        imageView.frame = .init(x: 47.5, y: 24, width: 128, height: 83)
        //        imageView.layer.shadowColor = #colorLiteral(red: 0.07843137255, green: 0.05098039216, blue: 0.01960784314, alpha: 1)
        //        imageView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        //        imageView.layer.shadowOpacity = 0.5
        //        imageView.layer.shadowRadius = 4
        //        imageView.layer.masksToBounds = true
        //        imageView.clipsToBounds = false
        //        myImage.sendSubviewToBack(imageView)
        //        self.myImage.addSubview(imageView)
        
        myImage.layer.shadowColor = #colorLiteral(red: 0.07843137255, green: 0.05098039216, blue: 0.01960784314, alpha: 1)
        myImage.frame = .init(x: 47.5, y: 24, width: 128, height: 83)
        myImage.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        myImage.layer.shadowOpacity = 1
        myImage.layer.shadowRadius = 4
        myImage.layer.masksToBounds = true
        myImage.clipsToBounds = false
        
    }
}
