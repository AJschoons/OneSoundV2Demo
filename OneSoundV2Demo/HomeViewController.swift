//
//  ViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let HomeViewControllerNibName = "HomeViewController"

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "Home"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Profile", style: .Plain, target: self, action: "profile")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Party", style: .Plain, target: self, action: "party")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func profile() {
        let profileViewController = ProfileViewController(nibName: ProfileViewControllerNibName, bundle: nil)
        let navC = UINavigationController(rootViewController: profileViewController)
        presentViewController(navC, animated: true, completion: nil)
        //navigationController?.pushViewController(profileViewController, animated: true)

    }
    
    func party() {
        let partyPageViewController = PartyPageViewController()
        let navC = UINavigationController(rootViewController: partyPageViewController)
        
        (UIApplication.sharedApplication().delegate as AppDelegate).window?.rootViewController = navC
        
        //presentViewController(navC, animated: true, completion: nil)
    }

}

