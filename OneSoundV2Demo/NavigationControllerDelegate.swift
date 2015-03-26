//
//  NavigationControllerDelegate.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 3/7/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject {
    override init() {
        super.init()
    }

}


extension NavigationControllerDelegate : UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if fromVC .isMemberOfClass(HomeViewController) {
            return ToProfileTransitionAnimator()
        } else if fromVC .isMemberOfClass(PartyPageViewController) {
            return ToProfileTransitionAnimator()
        }
        
        return FromProfileTransitionAnimator()
        
    }
}
