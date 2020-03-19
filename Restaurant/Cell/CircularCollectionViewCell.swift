//
//  CircularCollectionViewCell.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/10/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import UIKit
import Gemini

class CircularCollectionViewCell: GeminiCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
//        self.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
        //    var contentOffset: CGFloat = 0


    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

    }
//    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
//        super.apply(layoutAttributes)
//        let circularlayoutAttributes = layoutAttributes as! CircularCollectionViewLayoutAttributes
//        self.layer.anchorPoint = circularlayoutAttributes.anchorPoint
//        self.center.y += (circularlayoutAttributes.anchorPoint.y - 0.5) * self.bounds.height
//    }
}
