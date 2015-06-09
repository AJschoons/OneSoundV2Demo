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
  private(set) var partyButton: UIButton!
  private var firstViewDidAppear = true
  
  let AfterLaunchAnimationDuration: NSTimeInterval = 1
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    
    partyButton = UIButton.buttonWithType(UIButtonType.System) as! UIButton
    partyButton.frame = CGRectMake(self.view.center.x - 50, self.view.center.y - 25, 100, 50)
    partyButton.backgroundColor = UIColor.whiteColor()
    partyButton.layer.cornerRadius = 0.25*partyButton.bounds.width
    partyButton.setTitle("PARTY", forState: UIControlState.Normal)
    partyButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
    partyButton.addTarget(self, action: "onPartyButton", forControlEvents: UIControlEvents.TouchUpInside)
    view.addSubview(partyButton)
    
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
  
  func onProfileButton() {
    navigationController?.popViewControllerAnimated(true)
  }
  
  func onPartyButton() {
    
    let partyPageViewController = PartyPageViewController()
    partyPageViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
    presentViewController(partyPageViewController, animated: true, completion: nil)
  }
  
  func animateAfterLaunch() {
    UIView.animateWithDuration(AfterLaunchAnimationDuration) {
      self.partyButton.alpha = 1
      self.navigationBarView.alpha = 1
    }
  }
  
}
