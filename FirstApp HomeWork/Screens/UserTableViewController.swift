//
//  UserTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 07.03.2022.
//

import UIKit
import RealmSwift
import PromiseKit

class UsersTableViewController: UITableViewController {
    private let networkService = NetworkService()
    private let users = try? RealmService.load(typeOf: RealmUser.self)
    private var someUsers: Results<RealmUser>?
    private var token: NotificationToken?
    private var userToken: NotificationToken?

    override func viewDidLoad() {
        super.viewDidLoad()
        observeRealm()
        modify()
        networkService.getUserFriendsPromise()
            .thenMap(on: .global()) { json in
                return Promise.value(RealmUser(json))
            }
            .done { realmUsers in
                do {
                    try RealmService.save(items: realmUsers)
                } catch {
                    print(error)
                }
            }
            .catch { error in
                print(error)
            }
                
        //print(users) //смотреть в Realm Studio через Breakpoint
//        networkService.getUserFriends { [weak self] vkFriends in
//            guard
//                let self = self,
//                let friends = vkFriends
//            else { return }
//            try? RealmService.save(items: friends)
//            self.friends = friends
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modify()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        token?.invalidate()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let dest = segue.destination as? UserPhotosCollectionController,
            let index = tableView.indexPathForSelectedRow?.row {
            dest.userID = users?[index].id
            print(users?[index])
        }
    }
    
    private func observeRealm() {
        token = users?.observe({ changes in
            switch changes {
            case .initial(let results):
                if results.count > 0 {
                    self.tableView.reloadData()
                }
                //print(results)
            case let .update(results, deletions, insertions, modifications):
                print(results, deletions, insertions, modifications)
            case .error(let error):
                print(error)
            }
        })
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
