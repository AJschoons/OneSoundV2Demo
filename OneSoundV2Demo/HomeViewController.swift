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
        
        /*UIView.transitionWithView(profileViewController.view, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            presentViewController(navC, animated: true, completion: nil);
            }, completion: nil)*/

    }
    
    func party() {
        let partyPageViewController = PartyPageViewController()
        let navC = UINavigationController(rootViewController: partyPageViewController)

        if let window = (UIApplication.sharedApplication().delegate as AppDelegate).window {
        
            UIView.transitionWithView(window, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
            window.rootViewController = navC;
        }, completion: nil)
        }

    }

}

