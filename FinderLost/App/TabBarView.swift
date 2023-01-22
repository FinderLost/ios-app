//
//  TabBarView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var store: Store<AppState, AppAction>
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
            UserPreferencesView(store: store)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(.green)
    }
}
