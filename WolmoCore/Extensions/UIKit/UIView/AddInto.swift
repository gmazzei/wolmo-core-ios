//
//  AddInto.swift
//  WolmoCore
//
//  Created by Daniela Riesgo on 28/08/2018.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit

/**
 Indicates the way in which the layout is set.
 */

public enum LayoutMode {
    case constraints
    case frame
}

/**
 Represents the possible positions where you can add a view into another.
 */
public enum ViewPositioning {
    case back
    case front
}

public extension UIView {

    /**
     Loads the view into the specified containerView.

     - parameter containerView: The container view.
     - parameter insets: Insets that separate self from the container view. By default, .zero.
     - parameter viewPositioning: Back or Front. By default, .front.
     - parameter layout: Enum indicating the layout mode. By default, .constraints.

     - note: If you decide to use constraints to determine the size, the container's frame doesn't need to be final.
     Because of this, it can be used in `loadView()`, `viewDidLoad()` or `viewWillAppear(animated:)`.
     We strongly recommend to work with constraints as a better practice than frames.
     Also, this function matches left inset to leading and right to trailing of the view.
     */
    public func add(into containerView: UIView,
                    with insets: UIEdgeInsets = .zero,
                    in viewPositioning: ViewPositioning = .front,
                    layout: LayoutMode = .constraints) {

        switch layout {
        case .constraints:
            containerView.addSubview(self)

            translatesAutoresizingMaskIntoConstraints = false

            topAnchor.constraint(equalTo: containerView.topAnchor, constant: insets.top).isActive = true
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: insets.bottom).isActive = true
            leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: insets.left).isActive = true
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: insets.right).isActive = true
        case .frame:
            let bounds = containerView.bounds
            let x = insets.left
            let y = insets.top
            let width = bounds.width - x - insets.right
            let  height = bounds.height - y - insets.bottom
            frame = CGRect(x: x, y: y, width: width, height: height)

            containerView.addSubview(self)
        }

        if case viewPositioning = ViewPositioning.back {
            containerView.sendSubview(toBack: self)
        }
    }

}
