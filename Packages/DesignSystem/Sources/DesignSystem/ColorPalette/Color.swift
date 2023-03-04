//
//  Color.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI

extension Color {
    public static let dsPrimary: Color = Color(ColorPalette.dsPrimary.rawValue)
    public static let dsSecondary: Color = Color(ColorPalette.dsSecondary.rawValue)
    public static func content(_ color: ColorPalette.Content) -> Color { Color(color.rawValue) }
    public static func specific(_ color: ColorPalette.Specific) -> Color { Color(color.rawValue) }
    public static func status(_ color: ColorPalette.Status) -> Color { Color(color.rawValue) }
    public static func stroke(_ color: ColorPalette.Stroke) -> Color { Color(color.rawValue) }
    public static func text(_ color: ColorPalette.Text) -> Color { Color(color.rawValue) }
}
