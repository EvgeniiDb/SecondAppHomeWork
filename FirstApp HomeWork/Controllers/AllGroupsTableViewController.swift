//
//  AllGroupsTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit

class AllGroupsTableViewController: UITableViewController {

    private let networkService = NetworkService()
    let groups = [
        Group(
            avatar: UIImage(systemName: "doc.circle.fill"),
            name: "Group00"),
        Group(
            avatar: UIImage(systemName: "doc.circle.fill"),
            name: "Group01"),
        Group(
            avatar: UIImage(systemName: "doc.circle.fill"),
            name: "Group02"),
        Group(
            avatar: UIImage(systemName: "doc.circle.fill"),
            name: "Group03"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getUserGroup()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell
        else { return UITableViewCell() }
        
        let currentGroup = groups[indexPath.row]
        cell.configure(
            image: currentGroup.avatar,
            name: currentGroup.name)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
