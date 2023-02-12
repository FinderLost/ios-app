//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI

extension Color {
    public static var background: Color { ColorPalette.background.color }
    public static var dark: Color { ColorPalette.dark.color }
    public static var dark10: Color { ColorPalette.dark.color(.tone10) }
    public static var dark30: Color { ColorPalette.dark.color(.tone30) }
    public static var error: Color { ColorPalette.error.color }
    public static var errorTone25: Color { ColorPalette.error.color(.tone25) }
    public static var errorTone75: Color { ColorPalette.error.color(.tone75) }
    public static var information: Color { ColorPalette.information.color }
    public static var informationTone25: Color { ColorPalette.information.color(.tone25) }
    public static var informationTone75: Color { ColorPalette.information.color(.tone75) }
    public static var light: Color { ColorPalette.light.color }
    public static var first: Color { ColorPalette.first.color }
    public static var second: Color { ColorPalette.second.color }
    public static var success: Color { ColorPalette.success.color }
    public static var successTone25: Color { ColorPalette.success.color(.tone25) }
    public static var successTone75: Color { ColorPalette.success.color(.tone75) }
    public static var text: Color { ColorPalette.text.color }
    public static var textDark: Color { ColorPalette.text.color(.dark)}
    public static var textLight: Color { ColorPalette.text.color(.light) }
    public static var warning: Color { ColorPalette.warning.color }
    public static var warningTone25: Color { ColorPalette.warning.color(.tone25) }
    public static var warningTone75: Color { ColorPalette.warning.color(.tone75) }
}

private extension ColorPalette {
    var color: Color { Color(rawValue) }

    func color(_ tone: Tone) -> Color {
        Color(rawValue + "_" + tone.rawValue)
    }
}
