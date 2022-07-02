//
//  FriendPhotoCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit

class FriendPhotoCell: UICollectionViewCell {
    
    
    @IBOutlet weak var friendPhotoImageView: UIImageView!
    
    func loadImage(_ url: String) {
        Task(priority: .background) {
            do {
                self.imageView.image = try await LoaderImageLayerProxy.shared.loadAsync(url: url, cache: .fileCache)
            } catch {
                print(error)
            }
        }
    }
    
    
//    func configure(imageURL: String) {
//        friendPhotoImageView.kf.setImage(with: URL(string: imageURL))
//    }
//}
