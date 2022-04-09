//
//  RealmNews.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 09.04.2022.
//

import SwiftyJSON
import RealmSwift

class RealmNews: Object {
    @objc dynamic var sourceID: Int = 0
    @objc dynamic var text: String = ""
    @objc dynamic var postID: Int = 0
    @objc dynamic var type: String = ""

    override class func primaryKey() -> String? {
        "sourceID"
    }
    
    override class func indexedProperties() -> [String] {
        ["text", "type"]
    }
}

extension RealmNews {
    convenience init(_ json: JSON) {
        self.init()
        self.sourceID = json["sourceID"].intValue
        self.text = json["text"].stringValue
        self.postID = json["postID"].intValue
        self.type = json["type"].stringValue
    }
    
}
