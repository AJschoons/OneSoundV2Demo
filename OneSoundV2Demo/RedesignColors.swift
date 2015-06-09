//
//  RedesignColors.swift
//  OneSoundV2Demo
//
//  Created by adam on 6/7/15.
//  Copyright (c) 2015 Adam Schoonmaker. All rights reserved.
//

import Foundation

extension UIColor {
    
    class func backgroundGradientLightBeginning() -> UIColor
    {
        return UIColor.colorWithHexString("3DAA7F")
    }
    
    class func backgroundGradientDarkEnd() -> UIColor
    {
        return UIColor.colorWithHexString("0E7A92")
    }
}

extension UIColor {
    // Creates a UIColor from a Hex string.
    class func colorWithHexString (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rString = cString.substringToIndex(advance(cString.startIndex, 2))
        var gString = cString.substringFromIndex(advance(cString.startIndex, 2)).substringToIndex(advance(cString.startIndex, 2))
        var bString = cString.substringFromIndex(advance(cString.startIndex, 4)).substringToIndex(advance(cString.startIndex, 2))
        
        //var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        var r: UInt32 = 0, g: UInt32 = 0, b: UInt32 = 0
        NSScanner(string: rString).scanHexInt(&r)
        NSScanner(string: gString).scanHexInt(&g)
        NSScanner(string: bString).scanHexInt(&b)
        
        return UIColor(red: CGFloat(Int(r)) / 255.0, green: CGFloat(Int(g)) / 255.0, blue: CGFloat(Int(b)) / 255.0, alpha: CGFloat(1))
    }
}