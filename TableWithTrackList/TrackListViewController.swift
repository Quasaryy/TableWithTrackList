//
//  TrackListViewController.swift
//  TableWithTrackList
//
//  Created by Yury on 24.01.23.
//

import UIKit

class TrackListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension TrackListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
