//
//  RealmPhoto.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 19.03.2022.
//

import SwiftyJSON
import RealmSwift

class RealmPhoto: Object {
    
    @objc dynamic var friendId: Int = 0
    @objc dynamic var likesCount: Int = 0
    @objc dynamic var ownerId: Int = 0
    @objc dynamic var userLikeStatus: Int = 0
    @objc dynamic var photoUrlString: String =  ""


    override class func primaryKey() -> String? {
        "friendId"
    }
    
    override class func indexedProperties() -> [String] {
        ["firstName", "userAvatarURL"]
    }
//    var avatar: UIImage? {
//           return nil //!!!??????????
//    }
}

extension RealmPhoto {
    convenience init(_ json: JSON) {
        self.init()
        self.friendId = json["friendId"].intValue
        self.likesCount = json["likesCount"].intValue
        self.ownerId = json["ownerId"].intValue
        self.userLikeStatus = json["userLikeStatus"].intValue
        self.photoUrlString = json["photoUrlString"].stringValue
        
    }
}
