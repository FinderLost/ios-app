//
//  UserProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI
import Factory

struct UserProfileView: View {
    @Injected(Container.loginHandler)
    private var loginHandler: HandlerOf<FinderLost>

    @ObservedObject var store: Store<FinderLost>

    init(store: Store<FinderLost>) {
        self.store = store
        self.store.use(loginHandler)
    }

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
