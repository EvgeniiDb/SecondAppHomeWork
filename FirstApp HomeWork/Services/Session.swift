//
//  Session.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.02.2022.
//


final class UserSession {
    static let instance = UserSession()
    
    var token = ""
    var userID = 0
    
    var userIdString: String {
        return String(userID)
    }
    
    
    private init() { }
}


