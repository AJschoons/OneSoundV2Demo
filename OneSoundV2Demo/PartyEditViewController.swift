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
        
        //hide default back button. back is implemented in "done()"
        navigationItem.setHidesBackButton(true, animated: false)
        
        if let background = (UIApplication.sharedApplication().delegate as! AppDelegate).settingsBackgroundImage {
            self.view.addSubview(UIImageView(image: background))
        }
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
        let profileViewController = ProfileViewController()
        let homeViewController = HomeViewController()//HomeViewController(nibName: HomeViewControllerNibName, bundle: nil)
        let navC = UINavigationController(rootViewController: profileViewController)
        navC.pushViewController(homeViewController, animated: false)
        
        //So profile knows what to go "back" to
        (UIApplication.sharedApplication().delegate as! AppDelegate).appRootViewController = AppRootViewController.Home

        if let window = (UIApplication.sharedApplication().delegate as! AppDelegate).window {
            
            UIView.transitionWithView(window, duration: 0.5, options: UIViewAnimationOptions.TransitionFlipFromLeft, animations: {
                window.rootViewController = navC;
                }, completion: nil)
        }
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
