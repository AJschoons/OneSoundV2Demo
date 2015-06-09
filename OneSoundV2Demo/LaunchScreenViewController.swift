//
//  LaunchScreenViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/7/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// View controller the app launches into that looks the same as the launch screen
class LaunchScreenViewController: UIViewController {
  
  @IBOutlet weak var logoCenterVerticallyConstraint: NSLayoutConstraint!
  @IBOutlet weak var logoDistanceFromTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var backgroundView: UIView!
  
  let LogoAnimationDuration: NSTimeInterval = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
      finishLaunchingWithAnimation()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  /// Animate and navigate the the next view controller after finishing launching
  func finishLaunchingWithAnimation() {
    // Animate the logo from centered to the same top position as the next view controller,
    // then navigate to that view controller
    // http://stackoverflow.com/questions/12622424/how-do-i-animate-constraint-changes
    UIView.animateWithDuration(LogoAnimationDuration,
      animations: {
        self.backgroundView.removeConstraint(self.logoCenterVerticallyConstraint)
        self.backgroundView.addConstraint(self.logoDistanceFromTopConstraint)
        self.view.layoutIfNeeded()
      },
      completion: { something in
        self.performSegueWithIdentifier(FinishedLaunchingSegue.Identifier, sender: self)
      }
    )
  }
}
