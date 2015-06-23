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
  
  /// Overlay view used for navigating to other view controllers
  private var navigatingOverlayView: UIView?
  
  private var firstViewDidAppear = true
  
  let AfterLaunchAnimationDuration: NSTimeInterval = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
  
  /** 
    Sets the temporary navigation overlay view for animating to Party VC.
  
    Note: Make sure to call removeNavigatingOverlayView when the animation is done.
  
    The overlay view used to mimic the Create Party view while navigating to make the flipping
    animation seem like it's from the Create Party VC instead of the Home VC.
  */
  func setNavigatingOverlayView(overlayView: UIView) {
    navigatingOverlayView = overlayView
    view.addSubview(overlayView)
  }
  
  /// Removes the navigating overlay view; should be used once the navigation animation has completed
  func removeNavigatingOverlayView() {
    navigatingOverlayView?.removeFromSuperview()
  }
  
  /// Undo the storyboard segue to navigate to Profile, and navigate back here
  @IBAction func unwindFromProfile(segue: UIStoryboardSegue) {
    // Show segue, so we don't actually have to do anything here. Yay storyboards!
  }
  
  /// Undo the storyboard segue to navigate to Create Party, and navigate back here
  /// No changes made since done was not pressed
  @IBAction func unwindFromCreatePartyBack(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  func animateAfterLaunch() {
    UIView.animateWithDuration(AfterLaunchAnimationDuration) {
      self.partyButton.alpha = 1
      self.navigationBarView.alpha = 1
    }
  }
  
}
