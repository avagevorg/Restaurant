//
//  FirstViewController.swift
//  Restaurant
//
//  Created by Gevorg Avagyan on 3/9/20.
//  Copyright © 2020 Gevorg Avagyan. All rights reserved.
//

import UIKit
import Gemini

class ImageLabel {
    var image = UIImage()
    var label = String()
    
    init(image: UIImage, label: String) {
        self.image = image
        self.label = label
    }
}

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var circleCollectionView: GeminiCollectionView!
    @IBOutlet weak var ovalView: DemoView!
    @IBOutlet weak var MyTableView: UITableView!
    
    @IBOutlet weak var ovalViewSearchBar: UISearchBar!
    var imageLabelArray = [ImageLabel]()
    let model: [[UIColor]] = generateRandomData()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ovalViewSearchBar.barTintColor = .white
        ovalViewSearchBar.layer.cornerRadius = 10
        ovalViewSearchBar.layer.masksToBounds = true
        ovalViewSearchBar.searchTextField.backgroundColor = .white
        ovalViewSearchBar.searchTextField.placeholder = "Search"
        
        imageLabelArray.append(ImageLabel.init(image: UIImage(named: "Rest")!, label: "Restaurant"))
        imageLabelArray.append(ImageLabel.init(image: UIImage(named: "StreetFood")!, label: "Street Food"))
        imageLabelArray.append(ImageLabel.init(image: UIImage(named: "croissant")!, label: "Bakery"))
        imageLabelArray.append(ImageLabel.init(image: UIImage(named: "hot-coffee")!, label: "Hot Coffee"))
        
        
        self.title = ""
        self.tabBarItem.image = UIImage(named: "Group 142")
        self.tabBarItem.selectedImage = UIImage(named: "Group 142")
        
        MyTableView.delegate = self
        MyTableView.dataSource = self
        
        
        circleCollectionView.delegate = self
        circleCollectionView.dataSource = self
        
        configureAnimation()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MyTableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        MyTableView.reloadData()
    }
    
    func fillArray() {
        
        
    }
    
    func configureAnimation() {
        let screenWidth = UIScreen.main.bounds.width + 500
        circleCollectionView.gemini
            .circleRotationAnimation()
            .radius(screenWidth)
            .itemRotationEnabled(false)
            .rotateDirection(.clockwise)
        
        circleCollectionView.collectionViewLayout.invalidateLayout()
        circleCollectionView.layoutIfNeeded()
        
    }
    
    
    
    //:MARK Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let myLabel = UILabel()
        let headerView = UIView()
        
        myLabel.frame = CGRect(x: 20, y: 0, width: 300, height: 24)
        myLabel.font = UIFont.boldSystemFont(ofSize: 24)
        
        switch section {
        case 0:
            myLabel.text = "Nearby Hotspots"
        case 1:
            myLabel.text = "Cuisines and Experiences"
        case 2:
            myLabel.text = "Recomended for you"
        default:
            myLabel.text = "default"
        }
        
        
        headerView.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        
        headerView.addSubview(myLabel)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let button = UIButton()
        let footerView = UIView()
        
        footerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        footerView.frame = CGRect(x: 20, y: 0, width: 314, height: 40)
        
        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.frame = CGRect(x: 24, y: 0, width: 300, height: 40)
        button.setTitle("Show All (10+)", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = #colorLiteral(red: 0.07843137255, green: 0.05098039216, blue: 0.01960784314, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 4
        button.layer.masksToBounds = true
        button.clipsToBounds = false

        footerView.addSubview(button)
        return footerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.collectionView.tag = indexPath.section
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 {
            return 100
        }
        return 350
    }
    
    
    
    
}
    //:MARK Collectoin View

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CircularCollectionViewCell
        
        
        cell.cellImageView.image = imageLabelArray[indexPath.row].image
        cell.cellLabel.text  = imageLabelArray[indexPath.row].label
        
        
        self.circleCollectionView.animateCell(cell)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 90)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let cell = cell as? CircularCollectionViewCell {
            self.circleCollectionView.animateCell(cell)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        circleCollectionView.animateVisibleCells()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageLabelArray.count
    }
}
