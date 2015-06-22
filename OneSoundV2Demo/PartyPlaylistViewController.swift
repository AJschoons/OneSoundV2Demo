//
//  PartyContentViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let PartyPlaylistStoryboardIdentifier = "PartyPlaylist"

/// View controller for a party's playlist
class PartyPlaylistViewController: UIViewController {
  
    private var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension PartyPlaylistViewController: UITableViewDelegate {
    
}

extension PartyPlaylistViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.backgroundColor = UIColor.brownColor()
        return cell
    }
}