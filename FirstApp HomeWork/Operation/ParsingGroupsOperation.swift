//
//  ParsingGroupsOperation.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 09.05.2022.
//

import Foundation

class ParsingGroupsOperation: AsyncOperation {
    var groups: [Group]?
    
    override func main() {
        guard let getGroupsOperation = dependencies.first as? GetGroupsOperation,
              let data = getGroupsOperation.data else { return }
        
        groups = try? JSONDecoder().decode(GroupResponse.self, from: data).items
        self.state = .finished
    }
    
}
