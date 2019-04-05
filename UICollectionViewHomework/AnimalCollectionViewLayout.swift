//
//  AnimalCollectionViewLayout.swift
//  UICollectionViewHomework
//
//  Created by Maksim Ivanov on 05/04/2019.
//  Copyright © 2019 Maksim Ivanov. All rights reserved.
//

import UIKit

class AnimalCollectionViewLayout: UICollectionViewLayout {
    
    var bigItemHeight: Int = 0
    var smallItemHeight: Int = 0
    
    fileprivate var numberOfColumns = 2
    fileprivate var cellPadding: CGFloat = 6
    
    fileprivate var cache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentHeight: CGFloat = 0
    
    fileprivate var contentWidth: CGFloat {
        guard let collectionView = collectionView else {
            return 0
        }
        let insets = collectionView.contentInset
        return collectionView.bounds.width - (insets.left + insets.right)
    }
    
    override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }

    override func prepare() {
        /**
         You only calculate the layout attributes if cache is empty and the
         collection view exists.
         */
        guard cache.isEmpty == true, let collectionView = collectionView else {
            return
        }
        
        /**
         This declares and fills the xOffset array with the x-coordinate for every
         column based on the column widths. The yOffset array tracks the y-position
         for every column. You initialize each value in yOffset to 0, since this is
         the offset of the first item in each column.
         */
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        var column = 0
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        /**
         This loops through all the items in the first section, as this particular
         layout has only one section.
         */
        for item in 0 ..< collectionView.numberOfItems(inSection: 0) {
            
            let indexPath = IndexPath(item: item, section: 0)
            
            /**
             This is where you perform the frame calculation. width is the previously
             calculated cellWidth, with the padding between cells removed. You ask
             the delegate for the height of the photo and calculate the frame height
             based on this height and the predefined cellPadding for the top and
             bottom. You then combine this with the x and y offsets of the current
             column to create the insetFrame used by the attribute.
             */
            let isFirstOrFourth = indexPath.row % 4 == 0 || indexPath.row % 4 == 3
            let photoHeight = CGFloat(isFirstOrFourth ? bigItemHeight : smallItemHeight)
            let height = cellPadding * 2 + photoHeight
            let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
            let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
            
            /**
             This creates an instance of UICollectionViewLayoutAttribute, sets its
             frame using insetFrame and appends the attributes to cache.
             */
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            /**
             This expands contentHeight to account for the frame of the newly
             calculated item. It then advances the yOffset for the current column
             based on the frame. Finally, it advances the column so that the next
             item will be placed in the next column.
             */
            contentHeight = max(contentHeight, frame.maxY)
            yOffset[column] = yOffset[column] + height
            
            column = column < (numberOfColumns - 1) ? (column + 1) : 0
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributes = [UICollectionViewLayoutAttributes]()
        
        // Loop through the cache and look for items in the rect
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                visibleLayoutAttributes.append(attributes)
            }
        }
        return visibleLayoutAttributes
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
}
