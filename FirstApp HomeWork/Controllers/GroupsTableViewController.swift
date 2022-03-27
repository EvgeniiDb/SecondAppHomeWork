//
//  GroupsTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit
import RealmSwift

class GroupsTableViewController: UITableViewController {

    private let networkService = NetworkService()
    private let groups = try? RealmService.load(typeOf: RealmGroup.self)
    private var token: NotificationToken?
    
    
    
//    @IBAction func addGroup(segue: UIStoryboardSegue) {
//        guard
//            segue.identifier == "addGroup",
//            let allGroupsController = segue.source as? AllGroupsTableViewController,
//            let indexPath = allGroupsController.tableView.indexPathForSelectedRow
//        else { return }
//        let group = allGroupsController.groups[indexPath.row]
//        if !groups.contains(group) {
//            groups.append(group)
//            tableView.reloadData()
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeRealm()
        //print(users) //смотреть в Realm Studio через Breakpoint
        networkService.getUserGroups { [weak self] VKGroup in
            guard
                let self = self,
                let group = VKGroup
            else { return }
            try? RealmService.save(items: group)
//            self.friends = friends
        }
    }
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        networkService.getUserGroups { [weak self] VKGroups in
//            guard
//                let self = self,
//                let groups = VKGroups
//            else { return }
//            self.groups = groups
//        }
//    }

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
        groups?.count ?? 0
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

}
