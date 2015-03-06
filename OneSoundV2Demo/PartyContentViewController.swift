//
//  PartyContentViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class PartyContentViewController: UIViewController {
    
    weak var partyPageViewController: PartyPageViewController!
    private var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        
        tableView = UITableView(frame: view.frame)
        tableView.contentInset = UIEdgeInsetsMake(partyPageViewController.navbarHeight, 0, 0, 0)
        tableView.delegate = self
        view.addSubview(tableView)
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

extension PartyContentViewController: UITableViewDelegate {
    
}

extension PartyContentViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell();
        cell.backgroundColor = UIColor.brownColor()
        return cell
    }
}