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
    private var groups = try? RealmService.load(typeOf: RealmGroup.self)
    private var token: NotificationToken?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        observeRealm()
        networkService.getUserGroups { [weak self] vkGroups in
            guard
                let self = self,
                let groups = vkGroups
            else { return }
            //self.groups = groups
        }

    }
    
    
    private func observeRealm() {
        token = groups?.observe({ changes in
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
    
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as? GroupCell,
            let currentGroup = groups?[indexPath.row]
        else { return UITableViewCell() }

        
        cell.configure(
            imageURL: currentGroup.userAvatarURL,
            name: currentGroup.firstName)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

}
