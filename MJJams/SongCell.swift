//
//  SongCell.swift
//  MJJams
//
//  Created by Kinshuk Juneja on 5/16/17.
//  Copyright © 2017 MJBeats. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {

    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    var trackUrl : URL!
    var tapAction: ((UITableViewCell) -> ())?
    var didTapToPlay = true
    
    @IBAction func didTapPlay(_ sender: UIButton) {
        if didTapToPlay {
            didTapToPlay = false
            self.playButton.setImage(UIImage(named : "pause"), for: .normal)
        }
        else {
            didTapToPlay = true
            self.playButton.setImage(UIImage(named : "play"), for: .normal)
        }
        tapAction?(self)
    }

}
