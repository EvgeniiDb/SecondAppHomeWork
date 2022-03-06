//
//  User.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 23.01.2022.
//

import Foundation
import UIKit

//struct User {
//    
//    var name: String
//    let surname: String?
//    var avatar: UIImage?
//    var photoArray: [UIImage]?
// 
//    //var fullName: String { "\(name) \(surname)" }
//}

struct User {
    let avatar: UIImage?
    let name: String
    let surname: String
    
    var fullName: String { "\(name) \(surname)" }
}
