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
        let id = json["id"].intValue
        let albumID = json["album_id"].intValue
        let ownerID = json["owner_id"].intValue
        let sizeJSONs = json["sizes"].arrayValue
        let sizes = sizeJSONs.map { VKPhotoSize($0) }
    
        self.init(id: id, albumID: albumID,
                  ownerID: ownerID,
                  //sizeJSONs: size,
                  sizes: sizes)
    }
}
