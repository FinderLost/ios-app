//
//  UserProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import Utilities
import DesignSystem

import SwiftUI

import Factory

struct UserProfileView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        VStack {
            List {
                if case let .signIn(state) = store.state.login {
                    HStack {
                        ImageURL(
                            url: state.imageUrl,
                            placeHolder: UIImage(systemName: "person.fill")
                        )
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                        .padding(8)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text(state.name)
                            Text(state.email)
                        }
                    }
                    .listRowBackground(Color.light)

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
                    .listRowBackground(Color.light)
                }
                
                Section {
                    Text("Privacy")
                        .onTapGesture { print("limit::Privacy") }
                    Text("Notification")
                        .onTapGesture { print("limit::Notification") }
                }
                .listRowBackground(Color.light)
                Section {
                    Text("Help")
                        .onTapGesture { print("limit::Help") }
                    Text("Share the app")
                        .onTapGesture { print("limit::Share the app") }
                }
                .listRowBackground(Color.light)
                Section {
                    if store.state.login.isSignIn {
                        Button("Sign Out") { store.dispatch(.login(.signOut)) }
                            .foregroundColor(.red)
                    }
                }
                .listRowBackground(Color.light)

            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            if store.state.login.isSignOut {
                GoogleSignInButton { store.dispatch(.login(.signIn)) }
                    .cornerRadius(8)
                    .shadow(radius: 0)
                    .padding(16)
            }
        }
        .isLoading(store.state.login.isLoading)
        .background(Color.background)
        .navigationTitle("User profile")
    }
}

struct UserProfileView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let initialState = stateBuilderFake
            .set(\.login, .error("signIn"))
            .set(\.login, .loading)
            .set(\.login, .signOut)
            .set(\.login, .signIn(loginStateBuilderFake.entity))
            .entity

        let store = storeBuilderFake(
            initialState: initialState
        )

        TabView {
            NavigationView { UserProfileView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .environmentObject(store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
