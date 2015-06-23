//
//  CreatePartyViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/22/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// View controller for creating a party
class CreatePartyViewController: UIViewController {
  
  @IBOutlet weak var vibrancyViewContentView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  @IBAction func onCreateParty(sender: AnyObject) {
    // Makes the presenting VC look like this VC so the flip animation can be performed
    // Must copy view hierarchy before prepareForSegue/performSegue
    addViewHierarchyToPresentingViewController()
    
    performSegueWithIdentifier(CreatePartyFromHomeModalSegue.Identifier, sender: self)
  }
  
  /// Copies the view hierarchy into a new UIVisualEffect view hierarchy,
  /// then adds that to the presenting view controller
  func addViewHierarchyToPresentingViewController() {
    if let homeViewController = (presentingViewController! as! UINavigationController).topViewController as? HomeViewController {
      // Copies the view and recreates it
      let vibrancyContentViewCopy = NSKeyedUnarchiver.unarchiveObjectWithData(NSKeyedArchiver.archivedDataWithRootObject(vibrancyViewContentView)) as! UIView
      
      let blurEffect = UIBlurEffect(style: .Dark)
      let blurView = UIVisualEffectView(effect: blurEffect)
      blurView.frame = homeViewController.view.frame
      let vibrancyEffect = UIVibrancyEffect(forBlurEffect: blurEffect)
      let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
      vibrancyView.frame = blurView.frame
      vibrancyContentViewCopy.frame = vibrancyView.frame
      
      vibrancyView.contentView.addSubview(vibrancyContentViewCopy)
      blurView.contentView.addSubview(vibrancyView)
      
      homeViewController.setNavigatingOverlayView(blurView)
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == CreatePartyFromHomeModalSegue.Identifier {
      // Creating the party
    }
  }
}
