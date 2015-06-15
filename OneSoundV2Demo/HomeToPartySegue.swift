//
//  HomeToPartySegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/10/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let HomePartyFlipAnimationDuration = NSTimeInterval(0.6)
let HomePartyFlipAnimationOptions = UIViewAnimationOptions.CurveEaseInOut

/// Segue for transitioning from Home to Party
class HomeToPartySegue: UIStoryboardSegue {
  
  static let Identifier = "HomeToParty"
  
  override func perform() {
    
    let sourceNavigationController = sourceViewController.navigationController
    if sourceNavigationController != nil {
      let sourceNavigationController = sourceNavigationController!!
      
      UIView.animateWithDuration(HomePartyFlipAnimationDuration, delay: 0.0, options: HomePartyFlipAnimationOptions,
        animations: {
          sourceNavigationController.showViewController(self.destinationViewController as! UIViewController, sender: nil)
          UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromLeft, forView: sourceNavigationController.view, cache: false)
        },
        completion: nil
      )
    }
  }
}