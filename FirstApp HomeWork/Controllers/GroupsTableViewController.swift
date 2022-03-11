//
//  GroupsTableViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    var groups = [Group]()
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroup",
            let allGroupsController = segue.source as? AllGroupsTableViewController,
            let indexPath = allGroupsController.tableView.indexPathForSelectedRow
        else { return }
        let group = allGroupsController.groups[indexPath.row]
        if !groups.contains(group) {
            groups.append(group)
            tableView.reloadData()
        }
   
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
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
    
    
}