//
//  ProfileDetailView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 7/3/23.
//

import Redux
import Utilities

import SwiftUI

struct ProfileDetailView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        ZStack {
            if let userInfo = store.state.login.hasData {
                VStack(spacing: .spacingS) {
                    ZStack {
                        ImageURL(
                            url: userInfo.imageUrl,
                            placeHolder: UIImage(systemName: "person.fill")
                        )
                        .frame(width: 100, height: 100)
                        .cornerRadius(.cornerRadiusL)
                        .padding(.spacingS)
                    }
                    .background(Color.specific(.surface))
                    .cornerRadius(.cornerRadiusL)

                    ZStack {
                        VStack(alignment: .leading, spacing: .spacingXS) {
                            Text("Name")
                                .font(.headline)
                            Text(userInfo.name)
                                .font(.subheadline)
                        }
                        .padding(.spacingS)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.specific(.surface))
                    .cornerRadius(.cornerRadiusL)
                    .padding(.horizontal, .spacingS)

                    ZStack {
                        VStack(alignment: .leading, spacing: .spacingXS) {
                            Text("Email")
                                .font(.headline)
                            Text(userInfo.email)
                                .font(.subheadline)
                        }
                        .padding(.spacingS)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.specific(.surface))
                    .cornerRadius(.cornerRadiusL)
                    .padding(.horizontal, .spacingS)

                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.specific(.background))
        .isLoading(store.state.login.isLoading)
        .isError(store.state.login.hasError)
        .navigationTitle("Profile")
    }
}

#if DEBUG
struct ProfileDetailView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let initialState = stateBuilderFake
            .set(\.login, .loading)
            .set(\.login, .signOut)
            .set(\.login, .idle)
            .set(\.login, .failed("signIn"))
            .set(\.login, .signIn(loginStateBuilderFake.entity))
            .entity

        let store = storeBuilderFake(
            initialState: initialState
        )

        TabView {
            NavigationView { ProfileDetailView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
        .environmentObject(store)
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("ProfileDetailView")
    }
}
#endif
