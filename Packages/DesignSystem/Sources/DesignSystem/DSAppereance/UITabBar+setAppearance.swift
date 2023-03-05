//
//  UITabBar+setAppearance.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 5/3/23.
//

import UIKit

extension DSAppereance {
    enum UITabBar {
        static func setAppearance() {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundEffect = .init(style: .systemUltraThinMaterial)
            
            let tabBar = UIKit.UITabBar.appearance()
            tabBar.scrollEdgeAppearance = tabBarAppearance
            tabBar.standardAppearance = tabBarAppearance
            tabBar.unselectedItemTintColor = .red
        }
    }
}
