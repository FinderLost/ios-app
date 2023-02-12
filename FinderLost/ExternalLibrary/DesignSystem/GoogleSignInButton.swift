//
//  GoogleSignInButton.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI
import GoogleSignInSwift

struct GoogleSignInButton: View {
    @ObservedObject private var viewModel = GoogleSignInButtonViewModel(style: .wide)
    private var action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        GoogleSignInSwift.GoogleSignInButton(
            viewModel: viewModel,
            action: action
        )
        .cornerRadius(8)
        .shadow(radius: 0)
    }
}
