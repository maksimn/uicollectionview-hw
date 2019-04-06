//
//  StringExtension.swift
//  UICollectionViewHomework
//
//  Created by Maksim Ivanov on 06/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

import UIKit

extension String {

    public func parseString() -> UIColor {
        if let number = NumberFormatter().number(from: self) {
            let colorValue = CGFloat(truncating: number)
            
            return UIColor(red: colorValue, green: colorValue, blue: colorValue, alpha: 1.0)
        }
        
        return UIColor.black
    }
}
