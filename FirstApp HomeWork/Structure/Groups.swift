//
//  Group.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 23.01.2022.
//

import UIKit

struct Groups {
    
    let groupId: Int
    let name: String
    var avatar: UIImage?
    
    init(itemsGroup: ItemsGroup) {
        self.groupId = itemsGroup.id
        self.name = itemsGroup.name
        self.avatar = PhotoProcessing().downloadPhoto(urlString: itemsGroup.avatarPhoto)
    }
}
