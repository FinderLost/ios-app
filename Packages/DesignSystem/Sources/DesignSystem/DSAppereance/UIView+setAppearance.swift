//
//  UIView+setAppearance.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

extension DSAppereance {
    enum UIView {
        static func setAppearance() {
            let view = UIKit.UIView.appearance()
            view.tintColor = UIColor(Color.dsPrimary)
        }
    }
}
