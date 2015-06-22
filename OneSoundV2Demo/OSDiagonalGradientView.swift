//
//  OSVerticalGradientView.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/7/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import UIKit

@IBDesignable

/// View that draws the OneSound gradient from top-left to bottom-right corners
class OSDiagonalGradientView: UIView {
  
  override func drawRect(rect: CGRect) {
    // Canvas to paint on
    var currentContext = UIGraphicsGetCurrentContext()
    
    // Save the context to later be restored
    CGContextSaveGState(currentContext)
    
    // Container for a range of colors, in this case RGB
    var colorSpace = CGColorSpaceCreateDeviceRGB()
    
    // Define start and end colors
    var startColor = UIColor.backgroundGradientLightBeginning();
    var startColorComponents = CGColorGetComponents(startColor.CGColor)
    var endColor = UIColor.backgroundGradientDarkEnd();
    var endColorComponents = CGColorGetComponents(endColor.CGColor)
    
    // Write RGB and alpga components to an array
    var colorComponents
    = [startColorComponents[0], startColorComponents[1], startColorComponents[2], startColorComponents[3], endColorComponents[0], endColorComponents[1], endColorComponents[2], endColorComponents[3]]
    
    // Location for each color provided in components
    var locations: [CGFloat] = [0.0, 1.0]
    let locationsSize = 2
    
    // Creates a CGGradientRef with the gradient info
    var gradient = CGGradientCreateWithColorComponents(colorSpace, &colorComponents, &locations, locationsSize)
    
    // Draw gradient from start point to end point
    var startPoint = CGPointMake(0.0, 0.0) // Top left of view
    var endPoint = CGPointMake(self.frame.size.width, self.frame.size.height) // Bottom right of view
    CGContextDrawLinearGradient(currentContext, gradient, startPoint, endPoint, 0)
    
    // Restore the context
    CGContextRestoreGState(currentContext);
  }
}
