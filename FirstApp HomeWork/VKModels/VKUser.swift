//
//  VKUser.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 15.03.2022.
//

import Foundation

struct VKUser {
    let id: Int
    let firstName: String
    let lastName: String
    let userAvatarURL: String
}

extension VKUser: Codable {
    enum CodingKeys: String, CodingKey {

        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case userAvatarURL = "photo_200"

    }

}
    




    /*init(_ json: JSON) {
        let id = json["id"].intValue
        let firstName = json["first_name"].stringValue
        let lastName = json["last_name"].stringValue
        let userAvatarURL = json["photo_200"].stringValue
        
        self.init(
            id: id,
            firstName: firstName,
            lastName: lastName,
            userAvatarURL: userAvatarURL)
    }*/

