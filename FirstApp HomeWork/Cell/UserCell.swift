//
//  UserCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    func configure(
        image: UIImage?,
        name: String) {
        userAvatarImage.image = image
        userNameLabel.text = name
    }
}

