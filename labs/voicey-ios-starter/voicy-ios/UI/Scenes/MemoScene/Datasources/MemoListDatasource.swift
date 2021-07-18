//
//  MemoListDatasource.swift
//  voicy-ios
//
//  Created by Eliel A. Gordon on 1/5/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import Foundation
import UIKit

typealias CollectionViewCellCallback = (UICollectionView, IndexPath) -> UICollectionViewCell

class GenericCollectionViewDatasource<T>: NSObject, UICollectionViewDataSource {
    var items: [T] = []
    var configureCell: CollectionViewCellCallback?
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let configureCell = configureCell else {
            precondition(false, "You did not pass a configuration closure to configureCell, you must do so")
        }
        
        return configureCell(collectionView, indexPath)
    }
}
