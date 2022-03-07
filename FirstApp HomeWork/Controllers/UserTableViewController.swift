//
//  UserTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 07.03.2022.
//

import UIKit

class UserTableViewController: UITableViewController {

    private let networkService = NetworkService()
    var friends = [
        User(
            name: "Friend1",
            avatar: UIImage(systemName: "person.circle.fill"),
            surname: "Surname1"),
        User(
            name: "Friend2",
            avatar: UIImage(systemName: "person.circle.fill"),
            surname: "Surname2"),
        User(
            name: "Friend3",
            avatar: UIImage(systemName: "person.circle.fill"),
            surname: "Surname3"),
        User(
            name: "Friend4",
            avatar: UIImage(systemName: "person.circle.fill"),
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell", for: indexPath) as? FriendsTableViewCell
        else { return UITableViewCell() }
        let currentFriend = friends[indexPath.row]
         
        cell.configure(
            image: currentFriend.avatar,
            name: currentFriend.fullName)

        return cell
    }

}
