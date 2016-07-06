//
//  ConfirmationAlertViewModel.swift
//  SonicWords
//
//  Created by Francisco Depascuali on 5/18/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import Foundation

/**
 ConfirmationAlertViewModel models a `UIAlertController` where there are
 two options to select:

 * confirmAction: normally a action that do something.
 * dismissAction: normally a empty action.
*/
public struct ConfirmationAlertViewModel {
    
    public let title: String
    public let message: String
    public let dismissButtonTitle: String
    public let confirmButtonTitle: String
    public let dismissAction: ConfirmationAlertViewModel -> ()
    public let confirmAction: ConfirmationAlertViewModel -> ()
    
    /**
    Initialize a new ConfirmationAlertViewModel with the provided parameters.
    
    Is not necessary to provide all parameters. In most cases, is only
    needed `title`, `message` and `confirmAtion`.
    
    - parameter title: The alert title.
    - parameter message: The alert message.
    - parameter dismissButtonTitle: The dismiss button title.
    - parameter dismissAction: The dismiss button action.
    - parameter confirmButtonTitle: The confirm button title.
    - parameter confirmAction: The confirm button action.
    */
    public init(
        title: String,
        message: String,
        dismissButtonTitle: String = DefaultConfirmButtonTitle,
        dismissAction: ConfirmationAlertViewModel -> () = { _ in },
        confirmButtonTitle: String = DefaultDismissButtonTitle,
        confirmAction: ConfirmationAlertViewModel -> () = { _ in }) {
        self.title = title
        self.message = message
        self.confirmAction = confirmAction
        self.dismissAction = dismissAction
        self.dismissButtonTitle = dismissButtonTitle
        self.confirmButtonTitle = confirmButtonTitle
    }
    
    /**
     Default title for confirm button. You can provide a different default title by changing this property.
     - seealso: Localizable.String
    */
    public static var DefaultConfirmButtonTitle: String = "confirmation-alert-view.dismiss.title".localized.capitalizedString
    
    /**
     Default title for dismiss button. You can provide a different default title by changing this property.
     - seealso: Localizable.String
    */
    public static var DefaultDismissButtonTitle: String = "confirmation-alert-view.confirm.title".localized.capitalizedString
}
