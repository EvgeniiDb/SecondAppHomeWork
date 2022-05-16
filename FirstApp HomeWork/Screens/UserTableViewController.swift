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
    private let photoService: PhotoService = {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return appDelegate?.photoService ?? PhotoService()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        observeRealm()
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modify()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        token?.invalidate()
    }
    
    @objc
    private func refresh() {
        getUsers()
        
    }
    
    private func getUsers() {
        networkService.getUserFriends { [weak self] realmUsers in
            self?.tableView.refreshControl?.endRefreshing()
            guard let realmUsers = realmUsers else { return }
            do {
                try RealmService.save(items: realmUsers)
            } catch {
                print(error.localizedDescription)
            }

        }
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
                //break
                //print(results, deletions, insertions, modifications)
                self.tableView.reloadData()
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
            name: currentFriend.fullName,
        photoService: photoService)

        return cell
    }

}
