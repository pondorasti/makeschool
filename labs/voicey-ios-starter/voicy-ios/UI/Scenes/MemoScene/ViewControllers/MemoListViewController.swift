//
//  MemoListViewController.swift
//  voicy-ios
//
//  Created by Eliel A. Gordon on 1/5/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import UIKit

class MemoListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    let dataSource = GenericCollectionViewDatasource<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCollectionView()
    }
    
    func registerCollectionView() {
        collectionView.register(MemoListCell.self)
        
        dataSource.configureCell = { cv, indexPath in
            let cell = cv.dequeueReusableCell(forIndexPath: indexPath) as MemoListCell
            
            return cell
        }
        
        collectionView.dataSource = dataSource
        collectionView.delegate = self
    }
}

extension MemoListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
