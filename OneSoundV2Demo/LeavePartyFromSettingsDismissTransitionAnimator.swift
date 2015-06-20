//
//  LeavePartyFromSettingsDismissTransitionAnimator.swift
//  Pods
//
//  Created by adam on 6/18/15.
//
//

import UIKit

class LeavePartyFromSettingsDismissTransitionAnimator: NSObject {
   
}

extension LeavePartyFromSettingsDismissTransitionAnimator: UIViewControllerAnimatedTransitioning {
  
  // This is used for percent driven interactive transitions, as well as for container controllers that have companion animations that might need to
  // synchronize with the main animation.
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
    return 0.0
  }
  // This method can only be a nop if the transition is interactive and not a percentDriven interactive transition.
  func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    let source = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
    let destination = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
    var containerView = transitionContext.containerView()
    
    let snapshot = UIScreen.mainScreen().snapshotViewAfterScreenUpdates(false)
    
    destination.beginAppearanceTransition(true, animated: false)
    
    destination.view.addSubview(snapshot)
    
    destination.endAppearanceTransition()
    transitionContext.completeTransition(true)
    
  }
}
