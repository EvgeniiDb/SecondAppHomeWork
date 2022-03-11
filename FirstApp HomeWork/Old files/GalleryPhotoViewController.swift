//
//  GalleryPhotoViewController.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 13.02.2022.
//

import UIKit

class GalleryPhotoViewController: UIViewController {

    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var galleryView: GalleryPhotoCustomView!
    
    var photoArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backView.backgroundColor = UIColor.lightGray
        galleryView.setImages(images: photoArray)

    }

}
