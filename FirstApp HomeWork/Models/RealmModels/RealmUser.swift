//
//  RealmUser.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 19.03.2022.
//

import RealmSwift

class RealmUser: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var userAvatarURL: String = ""
}
