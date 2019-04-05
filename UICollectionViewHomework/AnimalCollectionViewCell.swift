//
//  AnimalCollectionViewCell.swift
//  UICollectionViewHomework
//
//  Created by Maksim Ivanov on 04/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {
    
    let animalNameLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        animalNameLabel.backgroundColor = UIColor.red
        animalNameLabel.textColor = UIColor.white
        addSubview(animalNameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        animalNameLabel.frame = self.contentView.frame
    }
}
