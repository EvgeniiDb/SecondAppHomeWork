//
//  VKResponse.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 14.03.2022.
//


import Foundation


struct VKResponse: Codable {
    let response: VKResponseObject
    
}


//extension VKResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case response
    }



struct VKResponseObject: Codable {
    let count: Int?
    let items: [VKUser]?
}


//struct VKResponse<T: Codable> : Codable {
//
//    let response: T
//
//    enum CodingKeys: String, CodingKey {
//        case response
//    }
//}
