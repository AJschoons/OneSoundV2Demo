//
//  CreatePartyFromHomeModalSegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/22/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let HomePartyFlipAnimationDuration = NSTimeInterval(0.75)
let HomePartyFlipAnimationOptions = UIViewAnimationOptions.CurveEaseInOut

/// Segue for transitioning from the modally presented Create Party VC to the Party VC
class CreatePartyFromHomeModalSegue: UIStoryboardSegue {
  
  static let Identifier = "CreatePartyFromHomeModal"
  
  override func perform() {
    
    if let presentingViewController = sourceViewController.presentingViewController as? UINavigationController, sourceViewController = sourceViewController as? UIViewController {
      
      if let homeViewController = presentingViewController.topViewController as? HomeViewController {
        // Dismiss the modally presented Create Party VC
        sourceViewController.dismissViewControllerAnimated(false) {
          
          // Then push the party VC onto the navigation stack with a flip animation, and navigate there
          UIView.animateWithDuration(HomePartyFlipAnimationDuration, delay: 0.0, options: HomePartyFlipAnimationOptions,
            animations: {
              presentingViewController.showViewController(self.destinationViewController as! UIViewController, sender: nil)
              UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: presentingViewController.view, cache: false)
            },
            completion: { something in
              // Remove the temporary copy of the Create Party VC view that was added to the Home VC to 
              // allow the animation to appear it was from the Party Settings view
              homeViewController.removeNavigatingOverlayView()
            }
          )
        }
      }
    }
  }
}
