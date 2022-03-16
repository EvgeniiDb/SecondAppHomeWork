//
//  GalleryPhotoViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 16.03.2022.
//

import UIKit

class GalleryPhotoViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var galleryView: GalleryPhotoCustomView!
    
    var photoArray = [UIImage]()
    var photoIndex = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        backView.backgroundColor = UIColor.lightGray
        galleryView.setImages(images: photoArray, index: photoIndex)
    }
}

