//
//  SecondCollectionViewCell.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/11/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var MyImage: UIImageView!
    @IBOutlet weak var RestName: UILabel!
    @IBOutlet weak var RestRating: UILabel!
    @IBOutlet weak var RestCurrency: UILabel!
    @IBOutlet weak var RestType: UILabel!
    @IBOutlet weak var RestLocation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MyImage.layer.cornerRadius = 20
        MyImage.layer.shadowColor = #colorLiteral(red: 0.07843137255, green: 0.05098039216, blue: 0.01960784314, alpha: 1)
        MyImage.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        MyImage.layer.shadowOpacity = 0.7
        MyImage.layer.shadowRadius = 4
        MyImage.layer.masksToBounds = true
        MyImage.clipsToBounds = false
    }

}
