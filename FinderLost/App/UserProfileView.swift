//
//  UserProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import SwiftUI
import Factory

struct UserProfileView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        List {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 80, height: 80)
            Text(store.state.login.email ?? "No email")
            Section(header: Text("Login with")) {
                if store.state.login.hasSession.not {
                    Button("Login") {
                        store.dispatch(.login(.signIn))
                    }
                } else {
                    Button("Sign Out") {
                        store.dispatch(.login(.signOut))
                    }
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(store: storeMock)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
