//
//  TableViewController.swift
//  TableWithTrackList
//
//  Created by Yury on 24.01.23.
//

import UIKit

class TrackListTableViewController: UITableViewController {

    // MARK: Properties
    var track = Track.getTracks()

    // MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? DetailsViewController
        guard let currentTrack = tableView.indexPathForSelectedRow?.row else { return }
        detailsVC?.track = track[currentTrack]
    }

}

// MARK: Methods
extension TrackListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return track.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let currentTrack = track[indexPath.row]
        cell.textLabel?.text = currentTrack.song
        cell.detailTextLabel?.text = currentTrack.artist
        cell.imageView?.image = UIImage(named: "\(currentTrack.track)")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        false
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .none
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let removedTrack = track.remove(at: sourceIndexPath.row)
        track.insert(removedTrack, at: destinationIndexPath.row)
    }

}
