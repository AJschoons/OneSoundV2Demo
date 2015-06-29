//
//  PartyContentViewController.swift
//  OneSoundV2Demo
//
//  Created by adam on 3/5/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout

let PartyPlaylistStoryboardIdentifier = "PartyPlaylist"

/// View controller for a party's playlist
class PartyPlaylistViewController: UIViewController {
  
  @IBOutlet weak var partyPlaylist: UICollectionView!
  let PartyPlaylistCurrentSongHeaderReuseIdentifier = "PartyPlaylistCurrentSongHeader"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let collectionViewLayout = partyPlaylist.collectionViewLayout as? CSStickyHeaderFlowLayout {
      collectionViewLayout.parallaxHeaderReferenceSize = CGSizeMake(self.view.frame.size.width, 300)
      collectionViewLayout.parallaxHeaderMinimumReferenceSize = CGSizeMake(self.view.frame.size.width, 150)
      collectionViewLayout.itemSize = CGSizeMake(view.frame.size.width, collectionViewLayout.itemSize.height)
      collectionViewLayout.parallaxHeaderAlwaysOnTop = true
    }
    
    partyPlaylist.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    partyPlaylist.registerNib(UINib(nibName: PartyPlaylistCurrentSongHeaderNibName, bundle: nil), forSupplementaryViewOfKind: CSStickyHeaderParallaxHeader, withReuseIdentifier: PartyPlaylistCurrentSongHeaderReuseIdentifier)
  }
}

extension PartyPlaylistViewController: UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 15;
  }
  
  
  // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    return partyPlaylist.dequeueReusableCellWithReuseIdentifier("partySongCell", forIndexPath: indexPath) as! UICollectionViewCell
  }
  
  func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView
  {
    return partyPlaylist.dequeueReusableSupplementaryViewOfKind(CSStickyHeaderParallaxHeader, withReuseIdentifier: PartyPlaylistCurrentSongHeaderReuseIdentifier, forIndexPath: indexPath) as! UICollectionReusableView
  }
}

extension PartyPlaylistViewController: UICollectionViewDelegate {
  
}