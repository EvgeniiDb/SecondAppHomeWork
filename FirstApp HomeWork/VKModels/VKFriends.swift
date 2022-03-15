//
//  User.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 14.03.2022.
//
import Foundation

struct VKFriends: Codable {
    let count: Int
    let items: [VKUser] //uncomment for codable
}


















//struct ResponseFriends: Codable {
//    
//    let items: [ItemsFriend]
//    
//    enum CodingKeys: String, CodingKey {
//        case items
//    }
//}
//
//struct ItemsFriend: Codable {
//    
//    let id: Int
//    let firstName: String
//    let lastName: String
//    let avatarPhoto: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case firstName = "first_name"
//        case lastName = "last_name"
//        case avatarPhoto = "photo_50"
//
//    }
//}








