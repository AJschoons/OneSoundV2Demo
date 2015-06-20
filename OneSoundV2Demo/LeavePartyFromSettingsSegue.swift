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
    
    if let presentingViewController = sourceViewController.presentingViewController as? UINavigationController {
      if let sourceViewController = sourceViewController as? PartySettingsViewController {
        if let topViewController =  presentingViewController.topViewController as? PartyViewController {
          
          sourceViewController.dismissViewControllerAnimated(true) {
            presentingViewController.popToRootViewControllerAnimated(false)
          }
          
        }
      }
    }
  }
  
  /*override func perform() {
  
    if let presentingViewController = sourceViewController.presentingViewController as? UINavigationController {
      if let sourceViewController = sourceViewController as? PartySettingsViewController {
        if let topViewController =  presentingViewController.topViewController as? PartyViewController {
          
          let appDelegateWindow = UIApplication.sharedApplication().delegate!.window!!
          UIGraphicsBeginImageContextWithOptions(appDelegateWindow.frame.size, true, 1.0)
          sourceViewController.view.drawViewHierarchyInRect(appDelegateWindow.frame, afterScreenUpdates: false)
          let screenshot = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()
          
          //let snapshot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(true)
          
          //let screenshotImageView = UIImageView(image: screenshot)
          //topViewController.view.addSubview(snapshot)
          //topViewController.view.bringSubviewToFront(snapshot)

          UIView.animateWithDuration(12.0, delay: 0.0, options: HomePartyFlipAnimationOptions,
            animations: {
              
              // Have to first dismiss the modally presenting Party Settings before popping to root view controller
              self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
              UIView.setAnimationTransition(UIViewAnimationTransition.None, forView: sourceViewController.view, cache: false)
            },
            completion: { something in
              UIView.animateWithDuration(HomePartyFlipAnimationDuration, delay: 0.0, options: HomePartyFlipAnimationOptions,
                animations: {
                  
                  // Root view controller will be the Home View Controller
                  presentingViewController.popToRootViewControllerAnimated(false)
                  
                  UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: presentingViewController.view, cache: false)
                },
                completion: nil
              )
            }
          )
          /*
          // Have to first dismiss the modally presenting Party Settings before popping to root view controller
          sourceViewController.dismissViewControllerAnimated(true) {
            
            UIView.animateWithDuration(HomePartyFlipAnimationDuration, delay: 0.0, options: HomePartyFlipAnimationOptions,
              animations: {
                
                // Root view controller will be the Home View Controller
                presentingViewController.popToRootViewControllerAnimated(false)
                
                //UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: presentingViewController.view, cache: false)
              },
              completion: nil
            )
          }*/
          
        }
      }
    }
  }*/
}
