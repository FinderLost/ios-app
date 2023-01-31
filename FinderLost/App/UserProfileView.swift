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
            TextField("Token", text: $store.state.login.token)
            TextField("Error", text: $store.state.login.error)
            Section(header: Text("Login with")) {
                Button("Google") {
                    store.dispatch(.login(.checkAsync("checkAsync")))
                }
                Button("Google1") {
                    store.dispatch(.login(.checkAsync1("checkAsync1")))
                }
                Button("Google2") {
                    store.dispatch(.login(.checkAsync2("checkAsync2")))
                }
                Button("Submodule") {
                    store.dispatch(.login(.submodule(.checkAsync("checkAsyncSub"))))
                }
            }
        }

    }
}

//struct UserProfileView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserProfileView(store: storeMock)
//            .previewLayout(PreviewLayout.sizeThatFits)
//            .previewDisplayName("Default preview")
//    }
//}
