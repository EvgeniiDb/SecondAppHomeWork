//
//  UserCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {

    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configure(
        imageURL: String,
        name: String,
        photoService: PhotoService) {
        userNameLabel.text = name
            photoService.getImage(urlString: imageURL) { [weak self] image in
                DispatchQueue.main.async {
                    self?.userAvatarImage.image = image
                }
            }
    }
}

