//
//  Session.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.02.2022.
//

import Foundation


    final class Session {

    var token: String = ""
    var userID: Int = 0

    var userIdString: String {
        return String(userID)
    }

    static let instance = Session()

    private init() { }
}
