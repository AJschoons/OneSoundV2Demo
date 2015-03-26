//
//  FromProfileTransitionAnimator.swift
//  OneSoundV2Demo
//
//  Created by Corbin Rangler on 3/22/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

class FromProfileTransitionAnimator: NSObject {
    weak var transitionContext: UIViewControllerContextTransitioning?
    
}

extension FromProfileTransitionAnimator: UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // get reference to our fromView, toView and the container view that we should perform the transition in
        let container = transitionContext.containerView()
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        // set up from 2D transforms that we'll use in the animation
        let offScreenRight = CGAffineTransformMakeTranslation(container.frame.width, 0)
        let offScreenLeft = CGAffineTransformMakeTranslation(-container.frame.width, 0)
        let middleScreen = CGAffineTransformMakeTranslation((container.frame.width/2), 0)
        
        // start the toView to the left of the screen
        toView.transform = offScreenRight
        
        
        // add the both views to our view controller
        container.addSubview(toView)
        container.addSubview(fromView)
        
        // get the duration of the animation
        // DON'T just type '0.5s' -- the reason why won't make sense until the next post
        // but for now it's important to just follow this approach
        let duration = self.transitionDuration(transitionContext)
        
        // perform the animation!
        // for this example, just slid both fromView and toView to the left at the same time
        // meaning fromView is pushed off the screen and toView slides into view
        // we also use the block animation usingSpringWithDamping for a little bounce
        UIView.animateWithDuration(duration, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.8, options: nil, animations: {
            
            fromView.transform = offScreenLeft
            
            toView.transform = CGAffineTransformIdentity
            //toView.transform = offScreenRight
            
            }, completion: { finished in
                
                // tell our transitionContext object that we've finished animating
                transitionContext.completeTransition(true)
                
        })
        
        
        
        
        
        /*//1 keep a reference to the transitionContext out of the scope of this method
        self.transitionContext = transitionContext
        
        //2 gets reference to container view, the from and to VC, button from where action was triggered
        var containerView = transitionContext.containerView()
        
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as HomeViewController
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as ProfileViewController
        //if let button = fromViewController.homeProfileButton{ //going from home to profile
        var button = fromViewController.homeProfileButton!
        //3 adds the toVC as subview to containerView
        containerView.addSubview(toViewController.view)
        
        //4 creates 2 circular UIBeizerPath instances
        var circleMaskPathInitial = UIBezierPath(ovalInRect: button.frame)
        var extremePoint = CGPoint(x: button.center.x - 0,y: button.center.y + 2*CGRectGetHeight(toViewController.view.bounds))
        var radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y))
        var circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(button.frame, -radius, -radius))
        
        //5 creates a CABasicsAnimation on the path key that goes from cMPI to cMPF
        var maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toViewController.view.layer.mask = maskLayer
        
        //6
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")*/
        
        
        //}else {
        //}
        
        
        /*//3 adds the toVC as subview to containerView
        containerView.addSubview(toViewController.view)
        
        //4 creates 2 circular UIBeizerPath instances
        var circleMaskPathInitial = UIBezierPath(ovalInRect: button.frame)
        var extremePoint = CGPoint(x: button.center.x - 0,y: button.center.y + CGRectGetHeight(toViewController.view.bounds))
        var radius = sqrt((extremePoint.x * extremePoint.x) + (extremePoint.y * extremePoint.y))
        var circleMaskPathFinal = UIBezierPath(ovalInRect: CGRectInset(button.frame, -radius, -radius))
        
        //5 creates a CABasicsAnimation on the path key that goes from cMPI to cMPF
        var maskLayer = CAShapeLayer()
        maskLayer.path = circleMaskPathFinal.CGPath
        toViewController.view.layer.mask = maskLayer
        
        //6
        var maskLayerAnimation = CABasicAnimation(keyPath: "path")
        maskLayerAnimation.fromValue = circleMaskPathInitial.CGPath
        maskLayerAnimation.toValue = circleMaskPathFinal.CGPath
        maskLayerAnimation.duration = self.transitionDuration(transitionContext)
        maskLayerAnimation.delegate = self
        maskLayer.addAnimation(maskLayerAnimation, forKey: "path")*/
        
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transitionContext?.completeTransition(!self.transitionContext!.transitionWasCancelled())
        self.transitionContext?.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view.layer.mask = nil
    }
    
}

