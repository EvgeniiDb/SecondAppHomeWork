//
//  VKNews.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 08.04.2022.
//
import SwiftyJSON
import Foundation

struct VKNews {
    let sourceID: Int
//    let date: Double
    let text: String
//    let attachments: [VKNewsAttachments]
//    let comments: VKComments
//    let likes: Any
//    let reposts: Any
//    let views: Any
    let postID: Int
    let type: String
}

extension VKNews {
    init(_ json: JSON) {
        let sourceID = json["source_id"].intValue
        //let date
        let text = json["text"].stringValue
//        let attachments = json["VKNewsAttachments"].stringValue
//        let comments = json["VKComments"].stringValue
//        let likes
//        let reposts
//        let views
        let postID = json["post_id"].intValue
        let type = json["type"].stringValue
        
        self.init(sourceID: sourceID,
                  text: "",
                  postID: postID,
                  type: type)
        
    }
}


//struct VKNewsAttachments {
//    let type: String
//    let photo: VKPhoto
//}
//
//extension VKNewsAttachments: Codable {
//    enum CodingKeys: String, CodingKey {
//        case type, photo
//    }
//}
//
//struct VKComments {
//    let count: Int
//    let canPost: Int
//}
//
//extension VKComments: Codable {
//    enum CodingKeys: String, CodingKey {
//        case count
//        case canPost = "can_post"
//    }
//}

