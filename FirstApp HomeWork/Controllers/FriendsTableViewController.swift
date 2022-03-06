//
//  FriendsTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 23.01.2022.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    private let networkService = NetworkService()
    var friends = [
        User(avatar: UIImage(systemName: "person.circle.fill"),
            name: "Friend1",
            surname: "Surname1"),
        User(
            avatar: UIImage(systemName: "person.circle.fill"),
            name: "Friend2",
            surname: "Surname2"),
        User(
            avatar: UIImage(systemName: "person.circle.fill"),
            name: "Friend3",
            surname: "Surname3"),
        User(
            avatar: UIImage(systemName: "person.circle.fill"),
            name: "Friend4",
            surname: "Surname4"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getUserFriends()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? FriendsTableViewCell
        else { return UITableViewCell() }
        let currentFriend = friends[indexPath.row]
         
        cell.configure(
            image: currentFriend.avatar,
            name: currentFriend.fullName)

        return cell
    }

}




//class FriendsTableViewController: UITableViewController {
//    
//    
//    @IBOutlet var friendsTableView: UITableView! {
//    
//    didSet {
//        friendsTableView.delegate = self
//        friendsTableView.dataSource = self
//    }
//    }
//    
//    
//    var friendsArray = [User]()
//    var savedObject: Any?
//    let dataSetingsUser = DataSettings()
//    
//    let reuseIdentifierUserTableCell = "UserCell"
//    let segueIdentifierToFotoController = "segueIdentifierToFotoController"
//    
//    func sortingUserNames() -> [String] {
//        var lettersArray: [String] = []
//        
//        for user in friendsArray {
//            let letter = String(user.name.prefix(1))
//            if !lettersArray.contains(letter) {
//                lettersArray.append(letter)
//            }
//        }
//        return lettersArray
//    }
//    
//    func filterByAlphabet(lettersArray: String) -> [User] {
//        var lettersOfName: [User] = []
//        
//        for item in friendsArray {
//            let nameLetter = String(item.name.prefix(1))
//            if nameLetter == lettersArray {
//                lettersOfName.append(item)
//            }
//        }
//        return lettersOfName
//    }
//    
//    func configure(userArray: [User]) {
//            self.friendsArray = userArray
//        }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        friendsArray = dataSetingsUser.setupUser()
//        
//        self.clearsSelectionOnViewWillAppear = false
//        self.navigationItem.rightBarButtonItem = self.editButtonItem
////        self.tableView.dataSource = self
////        self.tableView.delegate = self
//        
//        
//        friendsTableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifierUserTableCell)
//    }
//
//    // MARK: - Table view data source.
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return sortingUserNames().count
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return filterByAlphabet(lettersArray: sortingUserNames()[section]).count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//         guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierUserTableCell, for: indexPath)
//                as? FriendsTableViewCell else { return UITableViewCell() }
//        
//        let arrayLetter = filterByAlphabet(lettersArray: sortingUserNames()[indexPath.section])
//        cell.configure(user: arrayLetter[indexPath.row])
//        
//        return cell
//    }
//
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
//    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        friendsArray.remove(at: indexPath.row)
//        tableView.deleteRows(at: [indexPath], with: .automatic)
//    }
//    
//    // MARK: - Table view Delegate
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let cell = tableView.cellForRow(at: indexPath) as? FriendsTableViewCell,
//              let cellObject = cell.savedObject as? User else { return }
//        performSegue(withIdentifier: segueIdentifierToFotoController, sender: cellObject)
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//    
//    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sortingUserNames()[section].uppercased()
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 30
//    }
//
//    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == segueIdentifierToFotoController,
//           let dst = segue.destination as? FriendsFotoCollectionViewController,
//           let user = sender as? User {
//            dst.photoArray = user.photoArray!
//        }
//    }
//}

