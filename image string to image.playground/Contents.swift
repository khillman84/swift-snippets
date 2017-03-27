//: Playground - noun: a place where people can play

import UIKit

extension UIImage {
    
    typealias ImageCallback = (UIImage?)->()
    
    class func fetchImageWith(_ urlString : String, callback: @escaping ImageCallback){
        
        OperationQueue().addOperation {
            guard let url = URL(string: urlString) else { callback(nil); return }
            
            if let data = try? Data(contentsOf: url) {
                let image = UIImage(data: data)
                
                OperationQueue.main.addOperation {
                    callback(image)
                }
            } else {
                OperationQueue.main.addOperation {
                    callback(nil)
                }
            }
            
            
        }
    }
    
}
