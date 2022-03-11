//
//  Group.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 23.01.2022.
//

import Foundation
import UIKit

struct Group: Equatable {
    let avatar: UIImage?
    let name: String
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.name == rhs.name
    }
}

