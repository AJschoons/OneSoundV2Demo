//
//  PartyToHomeSegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/10/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// Segue for transitioning from Party to Home
class PartyToHomeSegue: UIStoryboardSegue {
  
  static let Identifier = "PartyToHome"
  
  override func perform() {
    if let sourceViewController = sourceViewController as? UIViewController {
      sourceViewController.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
  }
}