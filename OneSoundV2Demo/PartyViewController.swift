//
//  PartyViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/10/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

/// The segue for when the PartyViewController is instantiating its embedded PagedScrollViewController
let EmbedPartyPagedScrollViewControllerSegueIdentifier = "EmbedPartyPagedScrollViewController"

/// The parent view controller for an entire party
class PartyViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == EmbedPartyPagedScrollViewControllerSegueIdentifier {
      preparePagedScrollViewControllerFromSegue(segue)
    }
  }
  
  /// Instantiates the PagedScrollViewController with the proper child view controllers before loading
  private func preparePagedScrollViewControllerFromSegue(segue: UIStoryboardSegue) {
    if let pagedScrollViewController = segue.destinationViewController as? OSPagedScrollViewController {
      pagedScrollViewController.delegate = self
      
      let partyPlaylistViewController = storyboard?.instantiateViewControllerWithIdentifier(PartyPlaylistStoryboardIdentifier) as! PartyPlaylistViewController
      let partyMembersViewController = storyboard?.instantiateViewControllerWithIdentifier(PartyMembersStoryboardIdentifier) as! PartyMembersViewController
      
      pagedScrollViewController.scrollViewPages.append(partyPlaylistViewController)
      pagedScrollViewController.scrollViewPages.append(partyMembersViewController)
    }
  }
  
  /// Undo the storyboard segues this view controller causes, and navigate back here
  @IBAction func unwindToPartyViewController(segue: UIStoryboardSegue) {
    
    // Returning from Party Settings
    if let sourceViewController = segue.sourceViewController as? PartySettingsViewController {
      // Presented modally, so we don't actually have to do anything here. Yay storyboards!
    }
  }
}

extension PartyViewController: OSPagedScrollViewControllerDelegate {
  // MARK: OSPagedScrollViewControllerDelegate
  
  // Used to set the appropriate page for the Page Control
  func pagedScrollViewControllerDidScrollToPage(page: Int, withViewController: UIViewController) {

  }
}