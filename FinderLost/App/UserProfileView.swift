//
//  UserProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import DesignSystem

import SwiftUI

import Factory

struct UserProfileView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        VStack {
            List {
                if case let .signIn(state) = store.state.login {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .padding(8)
                        VStack(alignment: .leading, spacing: 8) {
                            Text(state.name)
                            Text(state.email)
                        }
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
                }

                Section {
                    Text("Privacy")
                    Text("Notification")
                }
                Section {
                    Text("Help")
                    Text("Share the app")
                        .onTapGesture {
                            print("limit::\(#function)")
                        }
                }
                Section {
                    if case .signIn = store.state.login {
                        Button("Sign Out") { store.dispatch(.login(.signOut)) }
                            .foregroundColor(Color.red)
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            if case .signOut = store.state.login {
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

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let signIn = Login.SignInBuilderFake()
            .set(\.email, "felipe@meep.me")
            .set(\.name, "Andrés Felipe Alzate Restrepo")
            .set(\.userId, "nil")
            .entity

        let state = FinderLost.StateBuilderFake()
            .set(\.login, .signOut)
            .set(\.login, .signIn(signIn))
            .set(\.login, .loading)
            .entity

        let store = FinderLost.storeBuilderFake(
            initialState: state
        )

        UserProfileView(store: store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
