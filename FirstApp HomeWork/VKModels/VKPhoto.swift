//
//  VKPhoto.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 21.03.2022.
//

import SwiftyJSON

struct VKPhoto {
    let id: Int
    let albumID: Int
    let ownerID: Int
    let sizes: [VKPhotoSize]
}

extension VKPhoto {
    init(_ json: JSON) {
        self.id = json["id"].intValue
        self.albumID = json["album_id"].intValue
        self.ownerID = json["owner_id"].intValue
        let sizeJSONs = json["sizes"].arrayValue
        self.sizes = sizeJSONs.map { VKPhotoSize($0) }
    }
}
