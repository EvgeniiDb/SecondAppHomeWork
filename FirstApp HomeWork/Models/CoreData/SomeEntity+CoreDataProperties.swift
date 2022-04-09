//
//  SomeEntity+CoreDataProperties.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 25.03.2022.
//

import Foundation
import CoreData


extension SomeEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SomeEntity> {
        return NSFetchRequest<SomeEntity>(entityName: "SomeEntity")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var surname: String?

}

extension SomeEntity : Identifiable {

}
