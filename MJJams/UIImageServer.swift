//
//  UIImageServer.swift
//  MJJams
//
//  Created by Kinshuk Juneja on 5/17/17.
//  Copyright © 2017 MJBeats. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    public func imageFromURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            guard error == nil else {
                print(error)
                return
            }
            DispatchQueue.main.async(execute: {
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}
