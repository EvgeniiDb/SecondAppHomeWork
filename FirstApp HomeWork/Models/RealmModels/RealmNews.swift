//
//  RealmNews.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 09.04.2022.
//

import SwiftyJSON
import RealmSwift

class RealmNews: Object {
    @Persisted var sourceID: Int = 0    //@objc dynamic
    @Persisted var text: String = ""
    @Persisted var postID: Int = 0
    @Persisted var type: String = ""
    @Persisted var author: Int = 0

    override class func primaryKey() -> String? {
        "sourceID"
    }
    
    override class func indexedProperties() -> [String] {
        ["text", "type"]
    }
    var avatar: UIImage? {
        return nil //!!!??????????
    }
}

extension RealmNews {
    convenience init(_ json: JSON) {
        self.init()
        self.sourceID = json["sourceID"].intValue
        self.text = json["text"].stringValue
        self.postID = json["postID"].intValue
        self.type = json["type"].stringValue
        self.author = json["author"].intValue
    }
    
}
