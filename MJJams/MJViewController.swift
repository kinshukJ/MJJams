//
//  TableViewController.swift
//  MJJams
//
//  Created by Kinshuk Juneja on 5/16/17.
//  Copyright © 2017 MJBeats. All rights reserved.
//

import UIKit
import AVFoundation

class MJViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    private var tracksCount = 1
    private var tracksDictionary = [[String : String]()]
    var soundTrack: AVAudioPlayer!
    var didTapToPlay = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ItunesClient.sharedInstance.loadTracks { (success) in
            if success {
                self.tracksDictionary = ItunesClient.sharedInstance.tracksDictionary
                self.tracksCount = ItunesClient.sharedInstance.count ?? 0
                self.tableView.reloadData()
            }
        }
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracksCount
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        cell.selectionStyle = .none
       
        let track = tracksDictionary[indexPath.row]
        
        cell.artistLabel.text = track["artistName"] ?? ""
        cell.collectionNameLabel.text = track["collectionName"] ?? ""
        cell.trackNameLabel.text = track["trackName"] ?? ""
        cell.artworkImageView.imageFromURL(urlString: track["artworkUrl60"] ?? "")
        cell.playButton.setImage(UIImage(named : "play"), for: .normal)
        
        if(track["previewUrl"] != nil) {
            cell.trackUrl = URL(string: track["previewUrl"]! )
        }
        
        let trackUrl = cell.trackUrl
        cell.tapAction = { (cell) in
            if self.didTapToPlay {
                self.didTapToPlay = false
                ItunesClient.sharedInstance.playTrack(from: trackUrl, pause: false)
            }
            else {
                self.didTapToPlay = true
                ItunesClient.sharedInstance.playTrack(from: trackUrl, pause: true)
            }
        }
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)
        let track = tracksDictionary[(indexPath?.row)!]
        
        let detailViewController = segue.destination as! DetailViewController
        detailViewController.track = track
        
    }

}
