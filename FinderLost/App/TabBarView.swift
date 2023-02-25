//
//  TabBarView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import SwiftUI
import Factory

struct TabBarView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        TabView {
            NavigationView {
                HomeView()
            }
            .tabItem {
                Image(systemName: "house")
            }
            NavigationView {
                YourMissingView()
            }
                .tabItem {
                    Image(systemName: "square.split.2x2.fill")
                }
            NavigationView {
                UserProfileView()
            }
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }
        .onAppear { store.use(HandlerDI.login()) }
        .onAppear { store.use(HandlerDI.missing()) }
        .onAppear { store.dispatch(.login(.getUserSession)) }
    }
}

struct TabBarView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let store = storeBuilderFake(
            initialState: .init()
        )

        TabBarView()
            .environmentObject(store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
