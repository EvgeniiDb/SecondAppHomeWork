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

    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getUsers()
        observeRealm()
    
        makeRefreshControl()
        configPrefetch()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        modify()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        token?.invalidate()
    }
    
    private func configPrefetch() {
        tableView.prefetchDataSource = self
    }
    
    private func makeRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
    }
    
    @objc
    private func refresh() {
        getUsers()
        
    }
    
    private func getUsers() {
//        startFrom: Date().timeIntervalSince1970 + 1 //для новостей
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


extension UsersTableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard
            let maxRow = indexPaths
                .map({ $0.row }) //если на секциях сделано то section делаем
                .max(),
            let users = self.users
        else { return }
        if
            maxRow > users.count - 4,
            !isLoading {
            isLoading = true
            //start_from // как входной параметр
            networkService.getUserFriends/*(startFrom: self.startFrom)*/ { [weak self ] users in
                guard
                    let self = self,
                    let selfUsers = self.users,
                let users = users
                else { return }
                let indexSet = IndexSet(integersIn: selfUsers.count ..< selfUsers.count + users.count)
                //let count = ((selfUsers.count + users.count) - selfUsers.count)
//                var indexPaths = [IndexPath]()
//                for index in 0...count {
//                    indexPaths.append(IndexPath(
//                                        row: maxRow + 3 + index,
//                                        section: 0))
//                }
//                var usersArray = [RealmUser]()
                //usersArray.append(contentsOf: users) //здесь будет newsArray
                self.tableView.insertSections( //для обновления секций
                    indexSet,
                    with: .automatic)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: indexPaths, with: .automatic) //в нашем случае обновляем ячейку
                self.tableView.endUpdates()
                self.isLoading = false
            }
        }
    }
    
    
}
