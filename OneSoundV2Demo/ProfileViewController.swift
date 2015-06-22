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
}
