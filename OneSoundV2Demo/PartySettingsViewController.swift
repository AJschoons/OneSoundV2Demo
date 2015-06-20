//
//  PartySettingsViewController.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class PartySettingsViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func onLeaveParty(sender: AnyObject) {
    let topViewController = (presentingViewController! as! UINavigationController).topViewController
    let snapshot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(true)
    topViewController.view.addSubview(snapshot)
    topViewController.view.bringSubviewToFront(snapshot)
    view = snapshot
    let taco = 5;
    performSegueWithIdentifier("LeavePartyFromSettings", sender: self)
  }
  

  @IBAction func onScreenshot(sender: AnyObject) {
    let snapshot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
    view.addSubview(snapshot)
    let wow = 5
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == LeavePartyFromSettingsSegue.Identifier {
      if let sourceViewController = segue.sourceViewController as? UIViewController {
        sourceViewController.transitioningDelegate = self
        sourceViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        sourceViewController.modalPresentationCapturesStatusBarAppearance = true
      }
    }
  }
}

extension PartySettingsViewController: UIViewControllerTransitioningDelegate {
  
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return LeavePartyFromSettingsDismissTransitionAnimator()
  }
}