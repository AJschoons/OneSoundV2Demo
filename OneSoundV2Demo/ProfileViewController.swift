//
//  ProfileViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/21/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// View controller for displaying a user's profile
class ProfileViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  /// Undo the storyboard segue to navigate to Profile Edit, and navigate back here
  /// No changes made since done was not pressed
  @IBAction func unwindFromProfileEditBack(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  /// Undo the storyboard segue to navigate to Profile Edit, and navigate back here
  /// Changes made since done was pressed
  @IBAction func unwindFromProfileEditDone(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
   
    //to show that this function is called when unwind segue is called. For some reason
    //this function is not getting called in homeVC like it is supposed to (to implement
    //custom unwind from profile). It is called before the @IBAction unwindFromProfile
    override func segueForUnwindingToViewController(toViewController: UIViewController, fromViewController: UIViewController, identifier: String?) -> UIStoryboardSegue {
        if let id = identifier{
            if id == "unwindFromProfile" {
                let unwindSegue = HomeToProfileSegueUnwind(identifier: id, source: fromViewController, destination: toViewController, performHandler: { () -> Void in
                    
                })
                return unwindSegue
            }
        }
        
        return super.segueForUnwindingToViewController(toViewController, fromViewController: fromViewController, identifier: identifier)
    }
}
