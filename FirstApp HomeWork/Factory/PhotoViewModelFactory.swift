//
//  PhotoViewModelFactory.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 22.06.2022.
//

import Foundation


final class PhotoViewModelFactory {
    func constructViewModels(photos: [VKPhoto]?,
                             viewSize: CGSize,
                             largeViewSize: CGSize) -> [PhotoViewModel]
    {
        guard let photos = photos else { return [PhotoViewModel]() }
        return photos.map { self.viewModel(photo: $0,
                                           viewSize: viewSize,
                                           largeViewSize: largeViewSize) }
    }

    private func viewModel(photo: VKPhoto,
                           viewSize: CGSize,
                           largeViewSize: CGSize) -> PhotoViewModel
    {
        return PhotoViewModel(id: photo.id,
                              photoURL: getUrl(photo: photo, size: viewSize),
                              largePhotoURL: getUrl(photo: photo, size: largeViewSize))
    }

    private func getUrl(photo: VKPhoto?, size: CGSize) -> String {
        guard let photo = photo else { return "" }
        let fullImageList = photo.images.sorted(by: { $0.width > $1.width })
        var filteredImageList = fullImageList.filter {
            SessionSettings.instance.enabledPhotoType.contains($0.type!) &&
                (CGFloat($0.width) >= size.width ||
                    CGFloat($0.height) >= size.height)
        }
        if filteredImageList.isEmpty { filteredImageList = fullImageList }
        return filteredImageList.first?.imageUrl ?? ""
    }
}
