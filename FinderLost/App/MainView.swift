//
//  MainView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        VStack {
            TextField(
                "Name",
                text: $store.state.userName,
                onEditingChanged: { _ in store.dispatch(.updateUserName(store.state.userName)) }
            )
            TextField(
                "Email",
                text: $store.state.userEmail,
                onEditingChanged: { _ in store.dispatch(.updateUserEmail(store.state.userEmail)) }
            )
        }
    }
}
