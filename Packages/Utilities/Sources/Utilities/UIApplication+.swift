//
//  UIApplication+.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import UIKit

extension UIApplication {
    var firstWindowScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    public var firstRootViewController: UIViewController? {
        firstWindowScene?.windows.first?.rootViewController
    }
}
