//
//  DetailsViewController.swift
//  TableWithTrackList
//
//  Created by Yury on 24.01.23.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var trackLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var track: Track!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        trackLabel.text = track.track
        imageView.image = UIImage(named: "\(track.track)")
    }

}
