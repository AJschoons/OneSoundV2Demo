//
//  ProfileEditViewController.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

let ProfileEditViewControllerNibName = "ProfileEditViewController"

class ProfileEditViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    //navigationItem.title = "Profile Settings"
    //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: "done")
    
    //hide default back button. back is implemented in "done()"
    navigationItem.setHidesBackButton(true, animated: false)
    
    //navigationController?.setNavigationBarHidden(true, animated: false)
    
    /*let doneButton   = UIButton.buttonWithType(UIButtonType.System) as UIButton
    //doneButton.frame = CGRectMake(self.view.center.x - 50, self.view.center.y - 25, 100, 50)
    doneButton.frame = CGRectMake(self.view.bounds.size.width/4, self.view.bounds.size.height/2, 100, 50)
    doneButton.backgroundColor = UIColor.whiteColor()
    doneButton.layer.cornerRadius = 0.25*doneButton.bounds.width
    doneButton.setTitle("DONE", forState: UIControlState.Normal)
    doneButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
    doneButton.addTarget(self, action: "done", forControlEvents: UIControlEvents.TouchUpInside)
    
    self.view.addSubview(doneButton)*/
    
  }
  
  func done() {
    view.endEditing(true)
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
