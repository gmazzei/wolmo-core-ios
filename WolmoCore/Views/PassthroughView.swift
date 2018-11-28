//
//  PassthroughView.swift
//  WolmoCore
//
//  Created by Gabriel Mazzei on 28/11/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation

/// View that transmits touches in the following way:
/// * if the touch was in a subview, the subview responds;
/// * if the touch was in an "empty" space, the touch moves on
/// in the hierarchy of views to some other (parent or brother, or brother's subview)
/// that may respond to that touch.
public class PassthroughView: UIView {
    
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let hitView = super.hitTest(point, with: event)
        return hitView == self ? nil : hitView
    }
    
}
