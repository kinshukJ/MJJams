//
//  itunesClient.swift
//  MJJams
//
//  Created by Kinshuk Juneja on 5/16/17.
//  Copyright © 2017 MJBeats. All rights reserved.
//

import Foundation
import AVFoundation

class ItunesClient  {
    
    //Singleton
    static let sharedInstance = ItunesClient()
    private init() {}
    
    private let url = URL(string: "https://itunes.apple.com/search?term=Michael+jackson")!
    var tracksDictionary = [[String : String]()]
    var count : Int?
    var trackPlayer = AVPlayer()
    
    func loadTracks( completion : @escaping (_ success: Bool)->() ) {
        
        let request = URLRequest(url: url, cachePolicy: .reloadRevalidatingCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
       
        let task : URLSessionDataTask = session.dataTask(with: request) { (data : Data?, response : URLResponse?, error : Error?) in
            
            if let data = data {
            
                if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? NSDictionary {
                    
                    self.tracksDictionary = Tracks.getTracksDictionary(from: dataDictionary["results"] as! [NSDictionary])
                    self.count = self.tracksDictionary.count
                    
                    completion(true)
                }
            }
        }
        task.resume()
    }
    
    func playTrack (from url : URL?, pause : Bool) {
        
        if let url = url {
           
            if(pause) {
    
                trackPlayer.pause()
            }
            else {
                trackPlayer.pause()
                trackPlayer = AVPlayer(url: url)
                trackPlayer.volume = 1.0
                trackPlayer.play()
            }
        }
    }
}
