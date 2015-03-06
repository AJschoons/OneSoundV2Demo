//
//  PartyEditViewController.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let PartyEditViewControllerNibName = "PartyEditViewController"

class PartyEditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = "Party Settings"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Leave", style: .Plain, target: self, action: "leaveParty")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "done")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func done() {
        view.endEditing(true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func leaveParty() {
        let homeViewController = HomeViewController(nibName: HomeViewControllerNibName, bundle: nil)
        let navC = UINavigationController(rootViewController: homeViewController)
        presentViewController(navC, animated: true, completion: nil)
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
