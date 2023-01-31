//
//  TabBarView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var store: Store<FinderLost>

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
