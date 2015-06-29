//
//  PartyPlaylistCurrentSongHeader.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/28/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit
import CSStickyHeaderFlowLayout

let PartyPlaylistCurrentSongHeaderNibName = "PartyPlaylistCurrentSongHeader"

class PartyPlaylistCurrentSongHeader: UICollectionViewCell {
  
  @IBOutlet weak var songBackgroundImage: UIImageView!
  
  @IBOutlet weak var songForegroundImage: UIImageView!
  @IBOutlet weak var songForegroundImageMaxWidthConstraint: NSLayoutConstraint!
  
  let MaxSongBackgroundImageBlurRadius: CGFloat = 8
  let MinSongBackgroundImageBlurRadius: CGFloat = 1
  let MaxSongBackgroundImageTintColorWhite: CGFloat = 0.4
  let MinSongBackgroundImageTintColorWhite: CGFloat = 0.1
  let MaxSongBackgroundImageTintColorAlpha: CGFloat = 0.7
  let MinSongBackgroundImageTintColorAlpha: CGFloat = 0.5
  
  /// Songs image that will be used for the background and foreground
  var songImage: UIImage? {
    didSet {
      songBackgroundImage.image = songImage
      songForegroundImage.image = songImage
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    songImage = UIImage(named: "davidGuetta")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    songForegroundImageMaxWidthConstraint.constant = frame.size.width / 3
  }
  
  override func applyLayoutAttributes(layoutAttributes: UICollectionViewLayoutAttributes!) {
    if let layoutAttributes = layoutAttributes as? CSStickyHeaderFlowLayoutAttributes {
      
      //
      // Change the background image blur as the collection view this header belongs to scrolls
      //
      
      // 0 = minimized, 1 = fully expanded, > 1 = stretched
      let progressiveness = layoutAttributes.progressiveness
      
      let blurRadius = max(MinSongBackgroundImageBlurRadius, (MaxSongBackgroundImageBlurRadius - (5 * progressiveness)))
      let tintColorWhite = max(MinSongBackgroundImageTintColorWhite, (MaxSongBackgroundImageTintColorWhite - 0.2 * progressiveness))
      let tintColorAlpha = min(MaxSongBackgroundImageTintColorAlpha, (MinSongBackgroundImageTintColorAlpha + 0.1 * progressiveness))
      let tintColor = UIColor(white: tintColorWhite, alpha: tintColorAlpha)
      
      songBackgroundImage.image = songImage?.applyBlurWithRadius(blurRadius, tintColor: tintColor, saturationDeltaFactor: 1.3, maskImage: nil)
    }
  }
}
