//
//  ItemCollectionViewCell.swift
//  loaner
//
//  Created by Erick Sanchez on 8/18/18.
//  Copyright © 2018 LinnierGames. All rights reserved.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configure(_ item: Item) {
        labelTitle.text = item.itemTitle
        imageView.image = item.itemImage
    }
}
