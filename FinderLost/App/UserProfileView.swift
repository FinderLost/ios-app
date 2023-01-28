//
//  UserProfileView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI

struct UserProfileView: View {
    @ObservedObject var store: Store<AppState, AppAction>

    var body: some View {
        List {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 80, height: 80)
            Section(header: Text("Login with")) {
                Button("Google") { }
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
