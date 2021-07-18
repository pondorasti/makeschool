//
//  ImageTableViewCell.swift
//  GCDAsyncImage
//
//  Created by Chase Wang on 2/23/17.
//  Copyright © 2017 Make School. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pictureImageView.image = nil
    }
}
