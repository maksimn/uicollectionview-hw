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
    let animalDescriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let greenValue = 6.0 * 16.0 / 256.0 as CGFloat
        let backgroundColor = UIColor(red: 0, green: greenValue, blue: 0, alpha: 1.0)
        self.contentView.backgroundColor = backgroundColor
        
        animalNameLabel.textColor = UIColor.white
        animalNameLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        addSubview(animalNameLabel)
        
        animalDescriptionLabel.textColor = UIColor.white
        animalDescriptionLabel.numberOfLines = 0
        addSubview(animalDescriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let fullSize = self.contentView.frame.size
        let fullWidth = fullSize.width
        let fullHeight = fullSize.height
        let padding = 6.0 as CGFloat
        let labelWidth = fullWidth - 2.0 * padding
        animalNameLabel.frame = CGRect(x: padding, y: fullHeight - 67, width: labelWidth, height: 18)
        animalDescriptionLabel.frame = CGRect(x: padding, y: fullHeight - 50, width: labelWidth, height: 50)
    }
}
