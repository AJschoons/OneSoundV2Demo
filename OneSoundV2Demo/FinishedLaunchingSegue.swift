//
//  FinishedLaunchingSegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/8/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// Segue for transitioning from Launch to Home
class FinishedLaunchingSegue: UIStoryboardSegue {
  
  static let Identifier = "FinishedLaunching"
  
  override func perform() {
    // Change the rootViewController of the navigation controller
    sourceViewController.navigationController??.viewControllers = [destinationViewController]
  }
}