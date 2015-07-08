//
//  HomeToProfileSegueUnwind.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 6/29/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import Foundation

class HomeToProfileSegueUnwind: UIStoryboardSegue {
    override func perform() {
        var homeVC = self.destinationViewController as! HomeViewController
        var profileVC = self.sourceViewController as! ProfileViewController
        
        var homeVCView = homeVC.view as UIView
        var profileVCView = profileVC.view as UIView
        
        var profileButton = homeVC.profileButton
        let window = UIApplication.sharedApplication().keyWindow
        window?.insertSubview(homeVCView, aboveSubview: profileVCView)
        
        //4
        var circleMaskPathFinal = UIBezierPath(ovalInRect: profileButton.frame)
        var extremePoint = CGPoint(x: profileButton.center.x - CGRectGetWidth(profileVC.view.bounds), y: profileButton.center.y - CGRectGetHeight(profileVC.view.bounds))
        var radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y))
        var circleMaskPathInitial = UIBezierPath(ovalInRect: CGRectInset(profileButton.frame, -radius, -radius))
        
        //5
        var maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        profileVC.view.layer.mask = maskLayer
        
        //6
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = 0.5
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.sourceViewController.dismissViewControllerAnimated(false, completion: nil)
    }
}