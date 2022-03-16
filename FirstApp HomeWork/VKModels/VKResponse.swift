//
//  VKResponse.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 14.03.2022.
//


import Foundation


struct VKResponse<T: Codable> : Codable {

    let response: T

    enum CodingKeys: String, CodingKey {
        case response
    }
}
