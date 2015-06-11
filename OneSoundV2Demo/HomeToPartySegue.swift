//
//  HomeToPartySegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/10/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// Segue for transitioning from Home to Party
class HomeToPartySegue: UIStoryboardSegue {
  
  static let Identifier = "HomeToParty"
  
  override func perform() {
    if let destinationViewController = destinationViewController as? UIViewController {
      destinationViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
      sourceViewController.presentViewController(destinationViewController, animated: true, completion: nil)
    }
  }
}
