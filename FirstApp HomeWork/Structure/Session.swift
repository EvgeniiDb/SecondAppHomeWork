//
//  Session.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.02.2022.
//

import Foundation


class UserSession {

    static let instance = UserSession()

    private init() { }

    var token: String = ""
    var userID: Int = 0
}





//    final class Session {
//
//    var token: String = ""
//    var userID: Int = 0
//
//    var userIdString: String {
//        return String(userID)
//    }
//
//    static let instance = Session()
//
//    private init() { }
//}
