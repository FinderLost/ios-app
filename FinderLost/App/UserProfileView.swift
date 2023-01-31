//
//  UserProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        List {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 80, height: 80)
            TextField("Token", text: $store.state.login.userId)
            TextField("Error", text: $store.state.login.error)
            Section(header: Text("Login with")) {
                Button("CheckSession") {
                    store.dispatch(.login(.checkSession))
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
