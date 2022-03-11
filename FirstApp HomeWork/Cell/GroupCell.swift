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
            image: UIImage?,
            name: String) {
            groupImageView.image = image
            groupNameLabel.text = name
        }

}
