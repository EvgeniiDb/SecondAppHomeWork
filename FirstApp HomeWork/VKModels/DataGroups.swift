//
//  DataGroups.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 15.03.2022.
//

import Foundation

struct ResponseGroups: Codable {
    
    let items: [ItemsGroup]
    
    enum CodingKeys: String, CodingKey {
        case items
    }
}

struct ItemsGroup: Codable {
    
    let id: Int
    let name: String
    let avatarPhoto: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case avatarPhoto = "photo_50"
    }
}
