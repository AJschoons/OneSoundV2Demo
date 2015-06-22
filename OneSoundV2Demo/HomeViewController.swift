//
//  ViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// View controller for when the app has launched and a user isn't in a party
class HomeViewController: UIViewController
{
  @IBOutlet weak var navigationBarView: UIView!
  @IBOutlet weak var partyButton: RoundedSidesButton!
  
  private var firstViewDidAppear = true
  
  let AfterLaunchAnimationDuration: NSTimeInterval = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Round the left & right edges to be circular
    //partyButton.layer.cornerRadius = 0.5*partyButton.bounds.height
    
    // Hide stuff to be animated for first appearance
    partyButton.alpha = 0
    navigationBarView.alpha = 0
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    if firstViewDidAppear {
      firstViewDidAppear = false
      animateAfterLaunch()
    }
  }
  
  /// Undo the storyboard segue to navigate to Profile, and navigate back here
  @IBAction func unwindFromProfile(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  func animateAfterLaunch() {
    UIView.animateWithDuration(AfterLaunchAnimationDuration) {
      self.partyButton.alpha = 1
      self.navigationBarView.alpha = 1
    }
  }
  
}
