//
//  UserTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 07.03.2022.
//

import UIKit

class UserTableViewController: UITableViewController {
    
    private let networkService = NetworkService()
    
    var friends: [VKUser] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getUserFriends { users in
            self.friends = users
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserCell
        else { return UITableViewCell() }
        let currentFriend = friends[indexPath.row]
        
        
        cell.configure(
            image: currentFriend.userAvatarURL,
            name: currentFriend.firstName)

        return cell
    }

}
