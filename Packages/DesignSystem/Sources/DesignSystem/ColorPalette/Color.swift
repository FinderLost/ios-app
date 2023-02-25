//
//  Color.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI

extension Color {
    public static let background: Color = ColorPalette.background.color
    public static let dark: Color = ColorPalette.dark.color
    public static let dark10: Color = ColorPalette.dark.color(.tone10)
    public static let dark30: Color = ColorPalette.dark.color(.tone30)
    public static let error: Color = ColorPalette.error.color
    public static let errorTone25: Color = ColorPalette.error.color(.tone25)
    public static let errorTone75: Color = ColorPalette.error.color(.tone75)
    public static let information: Color = ColorPalette.information.color
    public static let informationTone25: Color = ColorPalette.information.color(.tone25)
    public static let informationTone75: Color = ColorPalette.information.color(.tone75)
    public static let light: Color = ColorPalette.light.color
    public static let first: Color = ColorPalette.first.color
    public static let second: Color = ColorPalette.second.color
    public static let success: Color = ColorPalette.success.color
    public static let successTone25: Color = ColorPalette.success.color(.tone25)
    public static let successTone75: Color = ColorPalette.success.color(.tone75)
    public static let text: Color = ColorPalette.text.color
    public static let textDark: Color = ColorPalette.text.color(.dark)
    public static let textLight: Color = ColorPalette.text.color(.light)
    public static let warning: Color = ColorPalette.warning.color
    public static let warningTone25: Color = ColorPalette.warning.color(.tone25)
    public static let warningTone75: Color = ColorPalette.warning.color(.tone75)
}

private extension ColorPalette {
    var color: Color { Color(rawValue) }

    func color(_ tone: Tone) -> Color {
        Color(rawValue + "_" + tone.rawValue)
    }
}
