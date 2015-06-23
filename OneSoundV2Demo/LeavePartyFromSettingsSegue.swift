//
//  LeavePartyFromSettingsSegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/15/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// Segue for leaving a party from the Party settings
class LeavePartyFromSettingsSegue: UIStoryboardSegue {
  
  static let Identifier = "LeavePartyFromSettings"
  
  override func perform() {
    
    if let presentingViewController = sourceViewController.presentingViewController as? UINavigationController, sourceViewController = sourceViewController as? UIViewController {
      
      // Dismiss the modally presented settings
      sourceViewController.dismissViewControllerAnimated(false) {
        
        // Then navigate to the root of the navigation controller, HomeViewController, with a flip animation
        UIView.animateWithDuration(HomePartyFlipAnimationDuration, delay: 0.0, options: HomePartyFlipAnimationOptions,
          animations: {
            presentingViewController.popToRootViewControllerAnimated(false)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: presentingViewController.view, cache: false)
          },
          completion: nil
        )
        
      }
    }
  }
}
