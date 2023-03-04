//
//  YourMissingView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import DesignSystem

import Factory
import SwiftUI

struct YourMissingView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        ZStack {
            ZStack {
                Text("no missing yet")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.specific(.background))
        .navigationTitle("Your missing")
        .navigationBarItems(trailing: Button(action: { }) { Image(systemName: "plus") } )
    }
}

struct YourMissingView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let initialState = stateBuilderFake
            .set(\.missing, .idle)
            .set(\.missing, .success(missingStateBuilderFake.entity))
            .set(\.missing, .loading)
            .set(\.missing, .failed("error"))
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
        .previewDisplayName("YourMissingView")
    }
}
