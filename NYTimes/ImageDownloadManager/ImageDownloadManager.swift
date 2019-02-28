//
//  ImageDownloadManager.swift
//  NYTimes
//
//  Created by Bhuvanendra Pratap Maurya on 2/27/19.
//  Copyright © 2019 Valtech. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

var imageDownloadQueue: OperationQueue = {
    var queue = OperationQueue()
    queue.name = "com.imagedownload.imageDownloadqueue"
    queue.qualityOfService = .userInteractive
    return queue
}()

extension UIImageView {
    
    func downloadImage(_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        self.image = nil
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
        } else {
            if let operations = (imageDownloadQueue.operations as? [ImageOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isFinished == false && $0.isExecuting == true }), let operation = operations.first {
                operation.queuePriority = .veryHigh
            }else {
                let operation = ImageOperation(url: url, indexPath: nil)
                operation.queuePriority = .high
                operation.downloadHandler = { [weak self] (image, url, indexPath, error) in
                    DispatchQueue.main.async {
                        if let newImage = image {
                            imageCache.setObject(newImage, forKey: url.absoluteString as NSString)
                        }
                        self?.image = image
                    }
                }
                imageDownloadQueue.addOperation(operation)
            }
        }
    }
    
    func slowDownImageDownloadTaskfor (_ imageUrl: String) {
        guard let url = URL(string: imageUrl) else {
            return
        }
        if let operations = (imageDownloadQueue.operations as? [ImageOperation])?.filter({$0.imageUrl.absoluteString == url.absoluteString && $0.isFinished == false && $0.isExecuting == true }), let operation = operations.first {
            operation.queuePriority = .low
        }
    }
    
    func cancelAll() {
        imageDownloadQueue.cancelAllOperations()
    }
}




