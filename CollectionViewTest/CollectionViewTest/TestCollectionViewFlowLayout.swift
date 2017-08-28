//
//  TestCollectionViewFlowLayout.swift
//  CollectionViewTest
//
//  Created by OHSEUNGWOOK on 2017. 8. 29..
//  Copyright © 2017년 OHSEUNGWOOK. All rights reserved.
//

import UIKit

class TestCollectionViewFlowLayout: UICollectionViewFlowLayout {

    var page: NSInteger = 0
    
    override func prepare() {
        self.scrollDirection = UICollectionViewScrollDirection.horizontal;
        self.minimumInteritemSpacing = 0;
        self.minimumLineSpacing = 0;
        self.sectionInset = UIEdgeInsets.zero
    }


    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        self.page = NSInteger(ceil(proposedContentOffset.x / self.collectionView!.frame.size.width))
        return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
    }

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return CGPoint(x: (CGFloat(self.page) * (self.collectionView?.frame.size.width)!), y: 0.0)
    }
}
