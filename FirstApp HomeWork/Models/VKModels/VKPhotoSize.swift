//
//  VKPhotoSize.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 21.03.2022.
//

import SwiftyJSON
import CoreGraphics

struct VKPhotoSize {
    let url: String
    let width: Int
    let height: Int
    let type: String
    var aspectRatio: CGFloat { CGFloat(width) / CGFloat(height) } //для автомат получения размеров картинки (если не мозаика, а одно фото)
}

extension VKPhotoSize: Codable {
    enum CodingKeys: String, CodingKey {
        case url, width, height, type
    }
}


extension VKPhotoSize {
    init(_ json: JSON) {
        let sourceID = json["source_id"].intValue
        self.url = json["url"].stringValue
        self.width = json["width"].intValue
        self.height = json["height"].intValue
        self.type = json["type"].stringValue
    }
}
