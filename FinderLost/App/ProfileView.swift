//
//  ProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import Utilities
import DesignSystem

import SwiftUI

import Factory

struct ProfileView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        VStack {
            List {
                if let userInfo = store.state.login.hasData {
                    DSNavigationLink(destination: ProfileDetailView()) {
                        HStack {
                            ImageURL(
                                url: userInfo.imageUrl,
                                placeHolder: UIImage(systemName: "person.fill")
                            )
                            .clipShape(Circle())
                            .frame(width: 45, height: 45)
                            .padding(8)

                            VStack(alignment: .leading, spacing: 8) {
                                Text(userInfo.name)
                                Text(userInfo.email)
                            }
                        }
                        .background(Color.specific(.surface))
                    }

                } else {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding(8)
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Welcome to FinderLost!")
                        }
                    }
                    .listRowBackground(Color.specific(.surface))
                }
                
                Section {
                    NavigationLink("Privacy", destination: PrivacyView())
                    NavigationLink("Notification", destination: NotificationView())
                }
                .listRowBackground(Color.specific(.surface))

                Section {
                    NavigationLink("Help", destination: HelpView())
                    Text("Share the app")
                        .onTapGesture { print("limit::Share the app") }
                }
                .listRowBackground(Color.specific(.surface))

                Section {
                    if store.state.login.isSignIn {
                        Button("Sign Out") { store.dispatch(.login(.getSignOut)) }
                            .foregroundColor(.red)
                    }
                }
                .listRowBackground(Color.specific(.surface))

            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            if store.state.login.isSignOut {
                GoogleSignInButton { store.dispatch(.login(.getSignIn)) }
                    .cornerRadius(8)
                    .shadow(radius: 0)
                    .padding(16)
                    .listRowBackground(Color.specific(.surface))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.specific(.background))
        .navigationTitle("User profile")
        .isLoading(store.state.login.isLoading)
        .isError(store.state.login.hasError) { store.dispatch(.login(.getSignOut)) }
        .refreshable { store.dispatch(.login(.getInfo)) }
    }
}

struct ProfileView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let initialState = stateBuilderFake
            .set(\.login, .loading)
            .set(\.login, .signOut)
            .set(\.login, .signIn(loginStateBuilderFake.entity))
            .set(\.login, .idle)
            .set(\.login, .failed("signIn"))
            .entity

        let store = storeBuilderFake(
            initialState: initialState
        )

        TabView {
            NavigationView { ProfileView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
        .environmentObject(store)
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("ProfileView")
    }
}
