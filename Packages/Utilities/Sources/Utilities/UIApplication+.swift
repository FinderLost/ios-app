//
//  UIApplication+.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import UIKit

extension UIApplication {
    /// An extension to the UIApplication that provides easy access to the first UIWindowScene in the connectedScenes array.
    ///
    /// Use the firstWindowScene property to get the first UIWindowScene in the connectedScenes array, or nil if the array is empty or doesn't contain a UIWindowScene.
    var firstWindowScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    /// Use firstRootViewController property to get the root view controller of the first window scene of the app.
    /// It returns nil if there is no window scene.
    public var firstRootViewController: UIViewController? {
        firstWindowScene?.windows.first?.rootViewController
    }
}
