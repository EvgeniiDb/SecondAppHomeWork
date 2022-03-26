//
//  UserTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 07.03.2022.
//

import UIKit
import RealmSwift

class UsersTableViewController: UITableViewController {
    private let networkService = NetworkService()
    
//    let realmResultUser: Results<RealmUser>? = try? RealmService.load(typeOf: RealmUser.self)
//    var friends = [RealmUser]() {
//        didSet {
//            tableView.reloadData()
//        }
//    }
    
    let users = try? RealmService.load(typeOf: RealmUser.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkService.getUserFriends { [weak self] vkFriends in
            guard
                let self = self,
                let friends = vkFriends
            else { return }
            try? RealmService.save(items: friends)
//            self.friends = friends
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modify()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let dest = segue.destination as? UserPhotosCollectionController,
            let index = tableView.indexPathForSelectedRow?.row {
            dest.userID = users?[index].id
            print(users?[index])
        }
    }
    
    private func modify() {
        let someUser = try? RealmService
            .load(typeOf: RealmUser.self)
            .filter(NSPredicate(format: "id == %i", 1281161))
        print(someUser)
        if let currentUser = someUser?.first {
            do {
                let realm = try Realm()
                try realm.write {
                    currentUser.firstName = "Паша"
                }
            } catch {
                print(error)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell,
            let currentFriend = users?[indexPath.row]
        else { return UITableViewCell() }
        
        cell.configure(
            imageURL: currentFriend.userAvatarURL,
            name: currentFriend.fullName)

        return cell
    }

}
