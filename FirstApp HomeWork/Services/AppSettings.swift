//
//  AppSettings.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.06.2022.
//

import Foundation
import UIKit

class AppSettings {
    static let instance = AppSettings()
    let apiService = APIService()
    let apiAdapter = APIAdapter()
    let queuedService = QueuedOperations()
    let photoService = PhotoService()
}
