//
//  AllGroupsTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit
import RealmSwift

class AllGroupsTableViewController: UITableViewController {

    private let networkService = NetworkService()

    private let groups = try? RealmService.load(typeOf: RealmGroup.self)
    private var token: NotificationToken?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        networkService.getUserGroups { [weak self] vkGroups in
            guard
                let self = self,
                let groups = vkGroups
            else { return }
            //self.groups = groups
        }

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell
        else { return UITableViewCell() }

        let currentGroup = groups?[indexPath.row]
        cell.configure(
            imageURL: currentGroup!.userAvatarURL,
            name: currentGroup!.firstName)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
