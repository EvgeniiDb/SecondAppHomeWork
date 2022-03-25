//
//  VKResponse.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 14.03.2022.
//


struct VKResponse<T: Codable> : Codable {
    let response: T
}



//struct VKResponse: Codable {
//    let response: VKResponseObject
//
//}
//
//
////extension VKResponse: Codable {
//    enum CodingKeys: String, CodingKey {
//        case response
//    }
//
//
//
//struct VKResponseObject: Codable {
//    let count: Int?
//    let items: [VKUser]?
//    let itemsGroup: [ItemsGroup]?
//}
