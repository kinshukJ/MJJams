//
//  tracksDictionary.swift
//  MJJams
//
//  Created by Kinshuk Juneja on 5/16/17.
//  Copyright © 2017 MJBeats. All rights reserved.
//

import Foundation

class Tracks {

    static func getTracksDictionary (from apiDictionaryArray : [NSDictionary]) -> [[String: String]] {
        var tracksDictionary = [[String : String]()]
        tracksDictionary.removeAll()
        
        for apiDictionary in apiDictionaryArray {
            if (apiDictionary["kind"] as! String == "song") {
                let trackDictionary : [String : String] = [
                    "trackName"         : apiDictionary["trackName"] as! String,
                    "collectionName"    : apiDictionary["collectionName"] as! String,
                    "artistName"        : apiDictionary["artistName"] as! String,
                    "artworkUrl60"      : apiDictionary["artworkUrl60"] as! String,
                    "artworkUrl100"     : apiDictionary["artworkUrl100"] as! String,
                    "previewUrl"        : apiDictionary["previewUrl"] as! String,
                    "genre"             : apiDictionary["primaryGenreName"] as! String,
                    "explicitness"      : apiDictionary["trackExplicitness"] as! String
                ]
                tracksDictionary.append(trackDictionary)
            }
        }
        
        return tracksDictionary
    }
}
