//
//  GoogleSignInButton.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI
import Utilities
import GoogleSignInSwift

public struct GoogleSignInButton: View {
    @Environment(\.colorScheme)
    private var colorScheme
    @ObservedObject
    private var viewModel = GoogleSignInButtonViewModel(style: .wide)

    private var action: () -> Void

    public init(action: @escaping () -> Void) {
        self.action = action
    }

    public var body: some View {
        GoogleSignInSwift.GoogleSignInButton(
            viewModel: viewModel,
            action: action
        )
        .cornerRadius(8)
        .shadow(radius: 0)
        .onAppear { viewModel.scheme = .scheme(colorScheme) }
    }
}

private extension GoogleSignInButtonColorScheme {
    static func scheme(_ colorScheme: ColorScheme) -> Self {
        switch colorScheme {
        case .dark: return .dark
        case .light: return .light
        @unknown default:
            assertionDebug()
            return .light
        }
    }
}
