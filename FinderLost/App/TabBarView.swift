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
    @Injected(Container.loginHandler)
    private var loginHandler: HandlerOf<FinderLost>

    @ObservedObject var store: Store<FinderLost>

    init(store: Store<FinderLost>) {
        self.store = store
        self.store.use(loginHandler)
    }

    var body: some View {
        TabView {
            HomeView(store: store)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SearchView(store: store)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            UserProfileView(store: store)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }.onAppear {
            store.dispatch(.login(.getUserSession))
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(store: storeMock)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
