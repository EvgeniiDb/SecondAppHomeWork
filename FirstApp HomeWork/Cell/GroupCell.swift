//
//  GroupCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit

class GroupCell: UITableViewCell {
   
        @IBOutlet weak var groupImageView: UIImageView!
        @IBOutlet weak var groupNameLabel: UILabel!

        
        func configure(
            imageURL: String,
            name: String) {
            groupImageView.kf.setImage(with: URL(string: imageURL))
            groupNameLabel.text = name
        }

}
