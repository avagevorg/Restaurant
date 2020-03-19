//
//  TableViewCell.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/10/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import Foundation
import UIKit


struct RestaurantsInfo {
    
    var image = UIImage()
    var name = String()
    var location = String()
}

struct FoodInfo {
    var image = UIImage()
    var name = String()
}


class TableViewCell: UITableViewCell, UICollectionViewDelegate,  UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var restInfo = [RestaurantsInfo]()
    var foodInfo = [FoodInfo]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "first")!, name: "0", location: "15 Tumanyan"))
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "second")!, name: "1", location: "36 Tumanyan"))
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "third")!, name: "2", location: "2 Saryan"))
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "fourth")!, name: "3", location: "44 Sayat Nova"))
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "fifth")!, name: "4", location: "23 Amiryan"))
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "sixth")!, name: "5", location: "27 Abovyan"))
        restInfo.append(RestaurantsInfo.init(image: UIImage(named: "seventh")!, name: "6", location: "7 Mashtoc"))
        
        foodInfo.append(.init(image: UIImage(named: "pizza")!, name: "Pizza"))
        foodInfo.append(.init(image: UIImage(named: "burger")!, name: "Burger"))
        foodInfo.append(.init(image: UIImage(named: "nachos")!, name: "Nachos"))
        foodInfo.append(.init(image: UIImage(named: "shaurma")!, name: "Shaurma"))
        foodInfo.append(.init(image: UIImage(named: "burbeque")!, name: "Barbeque"))
        foodInfo.append(.init(image: UIImage(named: "pasta")!, name: "Pasta"))
        
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        self.collectionView.register(UINib(nibName: "FirstCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Cell1")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 {
            
            return foodInfo.count
            
        }
        return restInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        makeTransperant()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch collectionView.tag {
        case 1:
            let cell: FirstCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell1", for: indexPath) as! FirstCollectionViewCell
            cell.myLabel.text = foodInfo[indexPath.row].name
            cell.myImage.image = foodInfo[indexPath.row].image       
            return cell
        default:
            let cell: SecondCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! SecondCollectionViewCell
            cell.contentView.alpha = 0.7
            cell.MyImage.image = restInfo[indexPath.row].image
            cell.RestName.text = restInfo[indexPath.row].name
            cell.RestLocation.text = restInfo[indexPath.row].location
 
            return cell
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    makeTransperant()
        
        print("x", (collectionView.center.x + collectionView.contentOffset.x))
        
//        if let cells = collectionView.visibleCells as? [SecondCollectionViewCell]  {
//
//            for i in 0..<cells.count {
//                if let indexPath = collectionView.indexPath(for: cells[i]) {
//                    let x:CGFloat = 250
//
//                    if indexPath.row == 0 {
//                        cells[i].contentView.alpha = x / (x + scrollView.contentOffset.x)
//                    } else {
//                        cells[i].contentView.alpha = (CGFloat(indexPath.row) * x) / (scrollView.contentOffset.x)
//                    }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView.tag == 1 {
            return CGSize(width: 150, height: 100)
        }
        return CGSize(width: 314, height: 350)
    }
    
    
    func makeTransperant() {
        if let cells = collectionView.visibleCells as? [SecondCollectionViewCell] {
              for cell in cells {
                  cell.contentView.alpha = 0.7
              }
          }
          if  let visibleIndexPaths = collectionView.indexPathForItem(at: .init(x: (collectionView.center.x + collectionView.contentOffset.x), y: collectionView.center.y + collectionView.contentOffset.y)) {
              let cell1 = collectionView.cellForItem(at: visibleIndexPaths)
              cell1?.contentView.alpha = 1
          }
          
    }
}
