//
//  DismissSegue.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/14/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class DismissSegue: UIStoryboardSegue {
  
  static let Identifier = "Dismiss"
  
  override func perform() {
    if let sourceViewController = sourceViewController as? UIViewController {
      sourceViewController.dismissViewControllerAnimated(true, completion: nil)
    }
  }
}
