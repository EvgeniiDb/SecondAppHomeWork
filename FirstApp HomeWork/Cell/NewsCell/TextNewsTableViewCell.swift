//
//  TextNewsTableViewCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 04.05.2022.
//

import UIKit

final class TextNewsTableViewCell: UITableViewCell {

    //@IBOutlet weak var backView: UIView!
    @IBOutlet weak var newsTextLabel: UILabel!
    
    private func clearCell() {
        newsTextLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clearCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    func configure(textNews: RealmNews) {
        newsTextLabel.text = textNews.text
    }

}
