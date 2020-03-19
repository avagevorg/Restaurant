//
//  DemoView.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/9/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import Foundation
import UIKit

import UIKit
func generateRandomData() -> [[UIColor]] {
    let numberOfRows = 20
    let numberOfItemsPerRow = 15
    return (0..<numberOfRows).map { _ in
        return (0..<numberOfItemsPerRow).map { _ in UIColor.randomColor() }
    }
}
extension UIColor {
    class func randomColor() -> UIColor {
        let hue = CGFloat(arc4random() % 100) / 100
        let saturation = CGFloat(arc4random() % 100) / 100
        let brightness = CGFloat(arc4random() % 100) / 100
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
    }
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * .pi / 180.0
    }
}

class DemoView:UIView {
    
    
    var path: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func draw(_ rect: CGRect) {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: frame.height))
        path.addQuadCurve(to: CGPoint(x: frame.width, y: frame.height), controlPoint: CGPoint(x: frame.width / 2, y: frame.height + 30))
        path.close()

        let layer1 = CAShapeLayer()
        layer1.path = path.cgPath

        layer1.fillColor = self.backgroundColor?.cgColor

        self.layer.insertSublayer(layer1, at: 0)
        
    }
}
