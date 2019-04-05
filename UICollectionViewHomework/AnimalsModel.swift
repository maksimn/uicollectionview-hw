//
//  AnimalsModel.swift
//  UICollectionViewHomework
//
//  Created by Maksim Ivanov on 05/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

import UIKit

class AnimalsModel {
    func getAnimalsData() -> [[String: String]] {
        
        let animal1: [String: String] = ["name": "Собака", "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit", "grayValue": "0.1"]
        let animal2: [String: String] = ["name": "Кошка", "description": "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua", "grayValue": "0.2"]
        let animal3: [String: String] = ["name": "Мышка", "description": "Ut enim ad minim veniam, quis nostrud exercitation ullamco", "grayValue": "0.3"]
        let animal4: [String: String] = ["name": "Слон", "description": "laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit ", "grayValue": "0.4"]
        let animal5: [String: String] = ["name": "Олень", "description": "in voluptate velit esse cillum dolore eu fugiat nulla pariatur", "grayValue": "0.5"]
        let animal6: [String: String] = ["name": "Тигр", "description": "Excepteur sint occaecat cupidatat non proident", "grayValue": "0.6"]
        let animal7: [String: String] = ["name": "Пума", "description": "sunt in culpa qui officia deserunt mollit anim id est laborum", "grayValue": "0.7"]
        let animal8: [String: String] = ["name": "Рысь", "description": "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.", "grayValue": "0.8"]
        
        let animalData = [animal1, animal2, animal3, animal4, animal5, animal6, animal7, animal8]
        
        return animalData
    }
}
