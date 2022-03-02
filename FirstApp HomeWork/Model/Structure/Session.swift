//
//  Session.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.02.2022.
//

import Foundation

class Session {
    
    static let instance = Session()
    
    private init() { }
    
    var token: String = ""
    var userId: Int = 0
}
