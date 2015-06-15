//
//  PartyContentViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let PartyPlaylistStoryboardIdentifier = "PartyPlaylist"

class PartyPlaylistViewController: UIViewController {
  
    private var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

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