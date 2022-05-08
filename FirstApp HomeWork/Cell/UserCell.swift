//
//  UserCell.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 11.03.2022.
//

import UIKit
import Kingfisher

class UserCell: UITableViewCell {

    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    private let operationQ = OperationQueue()
//    var blurOperation : BlurImageOperation!
    
    func configure(
        imageURL: String,
        name: String) {
        let loadImage = BlockOperation {
            if let url = URL(string: imageURL),
               let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    OperationQueue.main.addOperation {
                        self.userAvatarImage.image = image
                    }
                }
            }
        }
        loadImage.completionBlock = {
            print("Some")
        }
        
        let blurOperation = BlurImageOperation(inputImage: userAvatarImage.image ?? UIImage())
        blurOperation.completionBlock = {
            OperationQueue.main.addOperation {
                self.userAvatarImage.image = blurOperation.outputImage!
            }
        }
        
        blurOperation.addDependency(loadImage)

        operationQ.addOperations([loadImage, blurOperation], waitUntilFinished: true)
    
    
    
//    func configure(
//        imageURL: String,
//        name: String) {
//        //userAvatarImage.kf.setImage(with: URL(string: imageURL))
//            userAvatarImage.kf.setImage(with: URL(string: imageURL)) { [weak self] result in
//                guard let self = self else { return }
//                switch result {
//                case.success(let response):
//                    let blurOperation = BlurImageOperation(inputImage: response.image)
//                    blurOperation.completionBlock = {
//                        OperationQueue.main.addOperation {
//                            self.userAvatarImage.image = blurOperation.outputImage!
//                        }
//                    }
////                    blurOperation.start() //запуск операции напрямую
//                    self.operationQ.addOperation(blurOperation)
////                    print(self?.operationQ.operations)
//                case.failure:
//                    break
//                }
//            }
            
            userNameLabel.text = name
    }
}

