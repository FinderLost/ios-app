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
            NavigationView { MissingView() }
                .tabItem { Label("", systemImage: "house") }
            NavigationView { YourMissingView() }
                .tabItem { Label("", systemImage: "square.split.2x2.fill") }
            NavigationView { ProfileView() }
                .tabItem { Label("", systemImage: "person.fill") }
        }
        .onAppear { store.dispatch(.login(.getUserSession)) }
        .onAppear { store.dispatch(.missing(.getMissingList)) }
    }
}

#if DEBUG
struct TabBarView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let store = storeBuilderFake()

        TabBarView()
            .environmentObject(store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("TabBarView")
    }
}
#endif
