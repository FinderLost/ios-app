//
//  ColorPalette.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI

/**
 This is a multi-line comment that provides an overview of the purpose of this class or method.

 - Important: Background & surface: The neutral colour palette is used to derive the surface and background functions. Surface colours affect the surfaces of components such as cards, sheets and menus. The background colour appears behind scrollable content.

 Stroke: The neutral colour palette is used to derive the stroke of elements and dividers. The stroke colours affect components that contain strokes, such as inputs or buttons. The colour of lines that function as dividers will also be defined by these colours.

 Content: Whenever elements, like icons, appear in front of surfaces, those elements should use colours designed to be clear and legible against the colours behind them. Content colours are primarily applied to iconography. Inverse colour is used for displaying the reverse of what’s seen in the surrounding UI. For example, buttons use the reverse colour in their content.

 Text: Like content colours, text colours are designed to be clear and legible with respect to the colours behind them. Text colours only apply to text styles. Reverse colour is used to show the opposite of what is seen in the surrounding user interface. For example, buttons use the inverse colour in their text.

 Status: Status colours are often referenced to other colours already present in the global palette. This means that we use the same colour values with different names to assign specific functions to them. Status colours correspond to the colour coding convention for info, warning, error and success.
 */
public enum ColorPalette: String {
    case dsPrimary = "primary"
    case dsSecondary = "secondary"

    /// Content
    public enum Content: String {
        /// content/base
        case base = "contentBase"
        /// content/inverse
        case inverse = "contentInverse"
        /// content/prominent
        case prominent = "contentProminent"
        /// content/variant
        case variant = "contentVariant"
    }

    /// Specific
    public enum Specific: String {
        /// specific/background
        case background = "background"
        /// specific/surface
        case surface = "surface"
        /// specific/surfaceVariant
        case variant = "surfaceVariant"
    }

    /// Status
    public enum Status: String {
        /// Status
        case error = "error"
        /// Status
        case info = "info"
        /// Status
        case success = "success"
        /// Status
        case warning = "warning"
    }

    /// Stroke
    public enum Stroke: String {
        /// stroke/base
        case base = "strokeBase"
        /// stroke/prominent
        case prominent = "strokeProminent"
        /// stroke/variant
        case variant = "strokeVariant"
    }

    /// Text
    public enum Text: String {
        /// text/base
        case base = "textBase"
        /// text/inverse
        case inverse = "textInverse"
        /// text/prominent
        case prominent = "textProminent"
    }
}
