//
//  RealmService.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 25.03.2022.
//

import RealmSwift

class RealmService {
    
    static let deletelMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    
    static func save<T: Object>(items: [T],
                                configuration: Realm.Configuration = deletelMigration,
                                update: Realm.UpdatePolicy = .modified) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items,
                      update: update)
        }
    }
    
    static func load<T:Object>(typeOf: T.Type) throws -> Results<T> {
        print(Realm.Configuration().fileURL ?? "")
        let realm = try Realm()
        let object = realm.objects(T.self)
        return object
    }
    static func delete<T:Object>(object: Results<T>) throws {
        let realm = try Realm()
        try realm.write {
            realm.delete(object)
        }
    }

}
















