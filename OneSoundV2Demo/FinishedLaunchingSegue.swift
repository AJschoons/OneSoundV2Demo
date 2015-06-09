//
//  FinishedLaunchingSegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/8/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// Segue for transitioning between launch screen and home screen
class FinishedLaunchingSegue: UIStoryboardSegue {
  
  static let Identifier = "FinishedLaunching"
  
  override func perform() {
    UIApplication.sharedApplication().delegate!.window!!.rootViewController = destinationViewController as? UIViewController
  }
}