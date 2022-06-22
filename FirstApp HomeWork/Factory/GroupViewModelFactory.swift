//
//  GroupViewModelFactory.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.06.2022.
//

import Foundation

final class GroupViewModelFactory {
    func constructViewModels(groups: [Group]?) -> [GroupViewModel] {
        guard let groups = groups else { return [GroupViewModel]() }
        return groups.map { self.viewModel(group: $0) }
    }

    private func viewModel(group: Group) -> GroupViewModel {
        return GroupViewModel(id: group.id,
                              name: group.groupName,
                              avatarURL: group.avatarURL)
    }
}
