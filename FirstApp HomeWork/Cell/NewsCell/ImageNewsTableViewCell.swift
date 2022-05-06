//
//  ImageNewsTableViewCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 04.05.2022.
//

import UIKit

final class ImageNewsTableViewCell: UITableViewCell {

    //@IBOutlet weak var backVew: UIView!
    @IBOutlet weak var newsImage: UIImageView!
    
    private func clearCell() {
        newsImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }

}
