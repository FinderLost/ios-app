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
                Text("Home")
            }
            NavigationView {
                SearchView()
            }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            NavigationView {
                UserProfileView()
            }
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .onAppear {
            store.use(HandlerDI.login())
            store.dispatch(.login(.getUserSession))
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
