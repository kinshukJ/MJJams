//
//  DetailViewController.swift
//  MJJams
//
//  Created by Kinshuk Juneja on 5/17/17.
//  Copyright © 2017 MJBeats. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var track : [String : String]!
    
    @IBOutlet weak var artworkUIView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var explicitnessLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trackNameLabel.text = "Track : \(track["trackName"]!)"
        collectionNameLabel.text = "Album : \(track["collectionName"]!)"
        artistNameLabel.text = "Artist : \(track["artistName"]!)"
        genreLabel.text = "Genre : \(track["genre"]!)"
        explicitnessLabel.text = track["explicitness"] ?? ""
        
        if let artworkUrl = track["artworkUrl100"] {
            artworkUIView.imageFromURL(urlString: artworkUrl)
        }
    }
}
