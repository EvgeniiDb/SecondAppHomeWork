//
//  LoaderPhotoProxy.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 02.07.2022.
//

import Foundation
import UIKit


class LoaderPhotoProxy: LoaderImage {
    static var shared: LoaderImage = LoaderImageLayerProxy()

    private init() {}

    func loadAsync(url: String, cache: Cache) async throws -> UIImage {
        print("load image url: \(url)")
        if let image = try await LoaderImageLayer.shared.loadAsync(url: url, cache: cache) as? UIImage {
            return image
        } else {
            return UIImage()
        }
    }
}


