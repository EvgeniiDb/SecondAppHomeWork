//
//  UserViewModelFactory.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.06.2022.
//

import Foundation
import UIKit

final class UserViewModelFactory {
    func constructViewModels(users: [User]?) -> [User] {
        guard let users = users else { return [User]() }
        return users.map { self.viewModel(user: $0) }
    }

    private func viewModel(user: User) -> User {
        return User(name: ((user.name ?? "")
                                 + " "
                                 + (user.surname ?? ""))
                                 .trimmingCharacters(in: .whitespaces),
                    avatar: user.avatar, surname: String)
    }
}
