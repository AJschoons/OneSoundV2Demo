//
//  ViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/1/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController
{
  @IBOutlet weak var navigationBarView: UIView!
  @IBOutlet weak var partyButton: UIButton!
  
  private var firstViewDidAppear = true
  
  let AfterLaunchAnimationDuration: NSTimeInterval = 1
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Round the left & right edges to be circular
    partyButton.layer.cornerRadius = 0.5*partyButton.bounds.height
    
    // Hide stuff to be animated for first appearance
    partyButton.alpha = 0
    navigationBarView.alpha = 0
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    if firstViewDidAppear {
      firstViewDidAppear = false
      animateAfterLaunch()
    }
  }
  
  /// Undo the storyboard segues this view controller causes, and navigate back here
  @IBAction func unwindToHomeViewController(segue: UIStoryboardSegue) {
    
    // Returning from Party Settings, meaning that a Party was left
    if let sourceViewController = segue.sourceViewController as? PartySettingsViewController {
      // Undo the animation used to get to Party, similar to HomeToParty segue
      if let navigationController = navigationController {
        UIView.animateWithDuration(HomePartyFlipAnimationDuration, delay: 0.0, options: HomePartyFlipAnimationOptions,
          animations: {
            navigationController.popViewControllerAnimated(false)
            UIView.setAnimationTransition(UIViewAnimationTransition.FlipFromRight, forView: navigationController.view, cache: false)
          },
          completion: nil
        )
      }
    }
  }
  
  func animateAfterLaunch() {
    UIView.animateWithDuration(AfterLaunchAnimationDuration) {
      self.partyButton.alpha = 1
      self.navigationBarView.alpha = 1
    }
  }
  
}
