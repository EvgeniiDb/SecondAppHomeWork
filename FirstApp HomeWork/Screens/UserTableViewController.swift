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
    
    let vkNews = [VKPhotoSize]()
    
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
        tableView.refreshControl?.addTarget(
            self,
            action: #selector(refresh),
            for: .valueChanged)
    }
    
    @objc
    private func refresh() {
        getUsers()
        
    }
    
    private func getUsers() {
        //startFrom: Date().timeIntervalSince1970 + 1
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
                
            case let .update(results, deletions, insertions, modifications):
//                break
                self.tableView.reloadData()
//                self.tableView.reloadRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
//                self.tableView.insertRows(at: <#T##[IndexPath]#>, with: <#T##UITableView.RowAnimation#>)
            case .error(let error):
                print(error)
            }
        })
    }
    
    private func observeUser() {
        guard let someUser = try? RealmService
                .load(typeOf: RealmUser.self)
                .filter(NSPredicate(format: "id == %i", 221995))
                .first
        else {
            return }
        userToken = someUser.observe({ changes in
            switch changes {
            case let .change(object, property):
                guard
                    let users = self.users,
                    let index = users
                        .enumerated()
                        .first(where: { $0.element.id == 221995 })?
                        .offset,
                    let visibleRows = self.tableView.indexPathsForVisibleRows
                else {
                    return self.tableView.reloadData()
                }
                let indexPath = IndexPath(row: index, section: 0)
                if visibleRows.contains(indexPath) {
                    self.tableView.reloadRows(at: [indexPath], with: .left)
                }

            case .deleted:
                print("User try to escape")
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
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        switch indexPath.row {     //данный метод экономит время на загрузку таблицы
//        case 2:
//            let tableWidth = tableView.bounds.width
//            let newsAspect = vkNews[indexPath.row].aspectRatio //error что-то с потоком связано Thread-1
//            return tableWidth * newsAspect
//        default:
//            return UITableView.automaticDimension
//        }
//    }

    
}

extension UsersTableViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard
            let maxRow = indexPaths
                .map({ $0.row })
                .max(),
            let users = self.users
        else { return }
        if
            maxRow > users.count - 4,
           !isLoading {
            isLoading = true
            // start_from как входной параметр
            networkService.getUserFriends /*(startFrom: self.startFrom)*/ { [weak self] users in
                guard
                    let self = self,
                    let selfUsers = self.users,
                    let users = users
                else { return }
                let indexSet = IndexSet(integersIn: selfUsers.count ..< selfUsers.count + users.count)
//                let count = ((selfUsers.count + users.count) - selfUsers.count)
//                var indexPaths = [IndexPath]()
//                for index in 0..<count {
//                    indexPaths.append(IndexPath(
//                                        row: maxRow + 3 + index,
//                                        section: 0))
//                }
//                var usersArray = [RealmUser]()
//                usersArray.append(contentsOf: users)
                self.tableView.insertSections(
                    indexSet,
                    with: .automatic)
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: indexPaths, with: .automatic)
                self.tableView.endUpdates()
                self.isLoading = false
                
            }
        }
    }
}
