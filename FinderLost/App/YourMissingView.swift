//
//  YourMissingView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux

import Factory
import SwiftUI

struct YourMissingView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        NavigationView {
            if let privateList = store.state.missing.hasData?.privateList {
                List(privateList, id: \.self) { item in
                    Text(item)
                }
            } else {
                ZStack {
                    Text("no missing yet")
                }
            }
        }
        .isLoading(store.state.missing.isLoading)
        .navigationBarTitle("Your missing")
        .navigationBarItems(trailing: Button(action: { }) { Image(systemName: "plus") } )
        .background(Color.background)
    }
}

struct SearchView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let initialState = stateBuilderFake
            .set(\.missing, .loading)
            .set(\.missing, .idle)
            .set(\.missing, .failed("error"))
            .set(\.missing, .success(missingStateBuilderFake.entity))
            .entity

        let store = storeBuilderFake(
            initialState: initialState
        )

        TabView {
            NavigationView { YourMissingView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
        .environmentObject(store)
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default preview")
    }
}
