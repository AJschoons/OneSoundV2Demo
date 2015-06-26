//
//  PartyViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/10/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit
import FXPageControl

/// The segue for when the PartyViewController is instantiating its embedded PagedScrollViewController
let EmbedPartyPagedScrollViewControllerSegueIdentifier = "EmbedPartyPagedScrollViewController"

/// The parent view controller for an entire party
class PartyViewController: UIViewController {
  
  @IBOutlet weak var pageControl: FXPageControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    pageControl.currentPage = 0;
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
  
  /// Undo the storyboard segue to navigate to Party Settings, and navigate back here
  /// No changes made since done was not pressed
  @IBAction func unwindFromPartySettingsBack(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  /// Undo the storyboard segue to navigate to Party Settings, and navigate back here
  /// Changes made since done was pressed
  @IBAction func unwindFromPartySettingsDone(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  /// Undo the storyboard segue to navigate to Party Add Song, and navigate back here
  /// No song added since back was pressed
  @IBAction func unwindFromPartyAddSongBack(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  /// Undo the storyboard segue to navigate to Party Add Song, and navigate back here
  /// Song was added
  @IBAction func unwindFromPartyAddSongWithSong(segue: UIStoryboardSegue) {
    // Presented modally, so we don't actually have to do anything here. Yay storyboards!
  }
  
  /// Undo the storyboard segue to navigate to Profile, and navigate back here
  @IBAction func unwindFromProfile(segue: UIStoryboardSegue) {
    // Show segue, so we don't actually have to do anything here. Yay storyboards!
  }
}

extension PartyViewController: OSPagedScrollViewControllerDelegate {
  // MARK: OSPagedScrollViewControllerDelegate
  
  // Used to set the appropriate page for the Page Control
  func pagedScrollViewControllerDidScrollToPage(page: Int, withViewController: UIViewController) {
    pageControl.currentPage = page
  }
}