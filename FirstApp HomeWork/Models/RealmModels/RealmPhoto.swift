//
//  RealmPhoto.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 19.03.2022.
//

import RealmSwift

class RealmPhoto: Object {
    
    @objc dynamic var friendId: Int = 0
    @objc dynamic var likesCount: Int = 0
    @objc dynamic var ownerId: Int = 0
    @objc dynamic var userLikeStatus: Int = 0
    @objc dynamic var photoUrlString: String =  ""
}
