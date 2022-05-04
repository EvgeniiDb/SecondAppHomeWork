//
//  UserPhotosCollectionController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 25.03.2022.
//

import UIKit

class UserPhotosCollectionController: UICollectionViewController {

    private let networkService = NetworkService()
    private var photos = [VKPhoto]() {
        didSet {
            collectionView.reloadData()
        }
    }
    var userID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let userID = userID {
            networkService.getUserPhotos(userID: userID) { [weak self] vkPhotos in
                guard
                    let self = self,
                    let photos = vkPhotos
                else { return }
                self.photos = photos
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "FriendPhotoCell",
                for: indexPath) as? FriendPhotoCell
        else { return UICollectionViewCell() }
        cell.configure(imageURL: photos[indexPath.row]
                        .sizes
                        .first(where: { (400..<650).contains($0.width) })?
                        .url ?? ""
        )
        return cell
    }
}
