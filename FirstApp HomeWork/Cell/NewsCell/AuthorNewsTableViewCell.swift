//
//  AuthorNewsTableViewCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 04.05.2022.
//

import UIKit

class AuthorNewsTableViewCell: UITableViewCell {

    //@IBOutlet weak var backVew: UIView!
    @IBOutlet weak var avatarAuthorNewsImage: UIImageView!
    @IBOutlet weak var nameAuthorNewsLabel: UILabel!
    //@IBOutlet weak var dateNewsLabel: UILabel!
    
    private func setupUI() {
        avatarAuthorNewsImage.layer.cornerRadius = 20
    }
    
    private func newsDateFormatter(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    private func clearCell() {
        avatarAuthorNewsImage.image = nil
        nameAuthorNewsLabel.text = nil
        //dateNewsLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        clearCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    func configure(authorUser: RealmUser, news: RealmNews) {
        avatarAuthorNewsImage.image = authorUser.avatar
            nameAuthorNewsLabel.text = authorUser.fullName
//            dateNewsLabel.text = newsDateFormatter(date: Date(timeIntervalSince1970: TimeInterval(news.date)))
    }
    
    func configure(authorGroup: RealmGroup, news: RealmNews) {
            avatarAuthorNewsImage.image = authorGroup.avatar
            nameAuthorNewsLabel.text = authorGroup.firstName
//            dateNewsLabel.text = newsDateFormatter(date: Date(timeIntervalSince1970: TimeInterval(news.date)))
    }

}
