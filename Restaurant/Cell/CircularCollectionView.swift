//
//  CircularCollectionView.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/10/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import UIKit

//class CircularCollectionView: UICollectionViewLayout {
//    

    
//    let itemSize = CGSize(width: 55, height: 55)
//    var angleAtExtreme: CGFloat {
//        return collectionView!.numberOfItems(inSection: 0) > 0 ?
//            -CGFloat(collectionView!.numberOfItems(inSection: 0) - 1) * anglePerItem : 0
//    }
//    var angle: CGFloat {
//        return angleAtExtreme * collectionView!.contentOffset.x / (collectionViewContentSize.width -
//            collectionView!.bounds.width)
//    }
//    var radius: CGFloat = 700 {
//        didSet {
//            invalidateLayout()
//        }
//    }
//    var anglePerItem: CGFloat {
//        return atan(itemSize.width / radius*1.5)
//    }
//    var attributesList = [CircularCollectionViewLayoutAttributes]()
//
//
//
//    override var collectionViewContentSize: CGSize {
//        return CGSize(width: CGFloat(collectionView!.numberOfItems(inSection: 0)) * itemSize.width,
//                      height: collectionView!.bounds.height)
//    }
//
//
//    override class var layoutAttributesClass: AnyClass {
//        return CircularCollectionViewLayoutAttributes.self
//
//    }
//    override func prepare() {
//        super.prepare()
//        let anchorPointY = -((itemSize.height / 2.0) + radius) / itemSize.height
//
//        let centerX = collectionView!.contentOffset.x + (collectionView!.bounds.width / 2.0)
//        attributesList = (0..<collectionView!.numberOfItems(inSection: 0)).map { (i)
//            -> CircularCollectionViewLayoutAttributes in
//            let attributes = CircularCollectionViewLayoutAttributes(forCellWith: NSIndexPath(item: i,section: 0) as IndexPath)
//            attributes.size = self.itemSize
//            attributes.center = CGPoint(x: centerX, y: self.collectionView!.bounds.midY)
//            attributes.angle = self.angle + (self.anglePerItem * CGFloat(i))
//            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
//            return attributes
//        }
//    }
//
//
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        return attributesList
//    }
//
//    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
//        return attributesList[indexPath.row]
//    }
//
//    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
//        return true
//    }
//}
//
//class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
//    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
//    var angle: CGFloat = 0 {
//        didSet {
//            zIndex = Int(angle * 1000000)
//            transform = CGAffineTransform(rotationAngle: angle)
//        }
//    }
//    override func copy(with zone: NSZone? = nil) -> Any {
//        let copiedAttributes: CircularCollectionViewLayoutAttributes = super.copy(with: zone) as! CircularCollectionViewLayoutAttributes
//
//        copiedAttributes.anchorPoint = self.anchorPoint
//        copiedAttributes.angle = self.angle
//        return copiedAttributes
//    }
//
//
//}

@IBDesignable
class ShadowView: UIView {
    //Shadow
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            self.updateView()
        }
    }
    @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            self.updateView()
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 3, height: 3) {
        didSet {
            self.updateView()
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 15.0 {
        didSet {
            self.updateView()
        }
    }

    //Apply params
    func updateView() {
        self.layer.shadowColor = self.shadowColor.cgColor
        self.layer.shadowOpacity = self.shadowOpacity
        self.layer.shadowOffset = self.shadowOffset
        self.layer.shadowRadius = self.shadowRadius
    }
}
