//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 9/3/23.
//

import UIKit

// MARK: - Don't Remove private
private enum MDimen {
    // MARK: - Spacing size
    /// $spacing_XXXS 2px
    static let spacingXXXS: CGFloat = 2
    /// $spacing_XXS 4px
    static let spacingXXS: CGFloat = 4
    /// $spacing_XS 8px
    static let spacingXS: CGFloat = 8
    /// $spacing_S 16px
    static let spacingS: CGFloat = 16
    /// $spacing_M 24px
    static let spacingM: CGFloat = 24
    /// $spacing_L 32px
    static let spacingL: CGFloat = 32
    /// $spacing_LL 40px
    static let spacingLL: CGFloat = 40
    /// $spacing_XL 48px
    static let spacingXL: CGFloat = 48
    /// $spacing_XXL 64px
    static let spacingXXL: CGFloat = 64
    /// $spacing_XXXL 80px
    static let spacingXXXL: CGFloat = 80

    // MARK: - Animation duration
    /// Animation duration: 0.2  - Default all over iOS
    static let animationDuration = 0.2

    // MARK: - Border style
    /// $border_thin 1px
    static let borderThin: CGFloat = 1
    /// $border_medium 2px
    static let borderMedium: CGFloat = 2
    /// $border_thick 4px
    static let borderThick: CGFloat = 4

    // MARK: - Corner radius
    /// $corner_radius_none  opx
    static let cornerRadiusN: CGFloat = 0
    /// $$corner_radius_extra_small  2px
    static let cornerRadiusXS: CGFloat = 2
    /// $$corner_radius_small  4px
    static let cornerRadiusS: CGFloat = 4
    /// $$corner_radius_medium  8px
    static let cornerRadiusM: CGFloat = 8
    /// $$corner_radius_large  16px
    static let cornerRadiusL: CGFloat = 16

    // MARK: - Visibility
    /// Value 1
    static let visible: CGFloat = 1
    /// Value 0
    static let invisible: CGFloat = 0
    /// Value 0.3
    static let translucent: CGFloat = 0.3

    // MARK: - Icon sizes
    /// Icon size: 16
    static let iconXS: CGFloat = 16
    /// Icon size: 24
    static let iconS: CGFloat = 24
    /// Icon size: 32
    static let iconM: CGFloat = 32
    /// Icon size: 40
    static let iconL: CGFloat = 40
}
