//
//  ViewController.swift
//  UICollectionViewHomework
//
//  Created by Maksim Ivanov on 04/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    fileprivate let animalsDataSource: [[String: String]] = AnimalsModel().getAnimalsData()
    
    fileprivate lazy var animalsCollectionView: UICollectionView = {
        let collectionViewLayout = AnimalCollectionViewLayout()
        collectionViewLayout.bigItemHeight = 320
        collectionViewLayout.smallItemHeight = 200
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        collectionView.dataSource = self
        collectionView.register(AnimalCollectionViewCell.self, forCellWithReuseIdentifier: "AnimalCollectionViewCell")
        collectionView.backgroundColor = UIColor.darkGray
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(animalsCollectionView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        animalsCollectionView.frame = view.frame
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return animalsDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let animalData = animalsDataSource[indexPath.row]
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnimalCollectionViewCell", for: indexPath) as? AnimalCollectionViewCell {
            
            cell.animalNameLabel.text = animalData["name"]
            cell.animalDescriptionLabel.text = animalData["description"]
            cell.animalImage.backgroundColor = ViewController.parseString(animalData["grayValue"] ?? "0.0")
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    private static func parseString(_ str: String) -> UIColor {
        if let number = NumberFormatter().number(from: str) {
            let colorValue = CGFloat(truncating: number)
            
            return UIColor(red: colorValue, green: colorValue, blue: colorValue, alpha: 1.0)
        }
        
        return UIColor.black
    }
}
