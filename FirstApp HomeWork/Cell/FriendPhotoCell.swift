//
//  FriendPhotoCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit

class FriendPhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var friendPhotoImageView: UIImageView!
    
    func configure(image: UIImage) {
        friendPhotoImageView.image = image
    }
    
    
    
}
