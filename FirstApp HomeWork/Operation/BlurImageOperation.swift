//
//  BlurImageOperation.swift
//  FirstApp HomeWork
//
//  Created by Евгений Доброволец on 08.05.2022.
//

import Foundation
import UIKit

class BlurImageOperation: Operation {
    var inputImage: UIImage
    var outputImage: UIImage?
    
    init(inputImage: UIImage) {
        self.inputImage = inputImage
        super.init()
    }
    
    override func main() {
        let inputCIImage = CIImage(image: inputImage)
        let filter = CIFilter(
            name: "CISepiaTone",
            parameters: [
                kCIInputImageKey: inputCIImage,
                kCIInputIntensityKey: 10.0,
            ])
        let context = CIContext()
        guard
            let outputCIImage = filter?.outputImage,
            let cgiImage = context.createCGImage(outputCIImage, from: outputCIImage.extent)
        else { return }
        
        outputImage = UIImage(cgImage: cgiImage)
    }

}
