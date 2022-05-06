//
//  RealmGroup.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 19.03.2022.
//
import SwiftyJSON
import RealmSwift

class RealmGroup: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var userAvatarURL: String = ""

    override class func primaryKey() -> String? {
        "id"
    }
    
    override class func indexedProperties() -> [String] {
        ["firstName", "userAvatarURL"]
    }
    var avatar: UIImage? {
        return nil //!!!??????????
    }
}

extension RealmGroup {
    convenience init(_ json: JSON) {
        self.init()
        self.id = json["id"].intValue
        self.firstName = json["first_name"].stringValue
        self.userAvatarURL = json["photo_200"].stringValue
    }
    
}

