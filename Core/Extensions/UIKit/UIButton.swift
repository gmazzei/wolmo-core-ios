//
//  UIButton.swift
//  Core
//
//  Created by Daniela Riesgo on 7/25/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /*
     Sets the button's title underlined with style and for state specified.
     
     - parameter title: Title for the button.
     - parameter style: NSUnderlineStyle with which the title is underlined.
        By default, StyleSingle.
     - parameter color: UIColor for the underline, or None if the color
        should be the same as the foreground's. By default, None.
     - parameter forState: UIControlState for which to set the title.
        By default, Normal.
     
     */
    public func setUnderlinedTitle(_ title: String, style: NSUnderlineStyle = .styleSingle, color: UIColor? = .none, forState state: UIControlState = UIControlState()) {
        var attributes: [String : AnyObject] = [NSUnderlineStyleAttributeName: style.rawValue as AnyObject]
        if let colorAttr = color {
            attributes[NSUnderlineColorAttributeName] = colorAttr
        }
        let underlinedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(underlinedText, for: state)
        
    }
    
}
