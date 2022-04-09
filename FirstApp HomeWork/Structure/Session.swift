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
    
    private init() { }
}


//class UserSession {
//
//    static let instance = UserSession()
//
//    private init() { }
//
//    var token: String = ""
//    var userID: Int = 0
//}
