//
//  MissingView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import SwiftUI

struct MissingView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        ZStack {
            if let privateList = store.state.missing.hasData?.publicList {
                List(privateList, id: \.self) { item in
                    Text(item)
                }
            } else {
                ZStack {
                    Text("no missing yet")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarItems(
            trailing:
                HStack {
                    Button(action: {}, label: { Image(systemName: "line.3.horizontal.decrease.circle") })
                    Button(action: {}, label: { Image(systemName: "plus") })
                }
        )
        .isLoading(store.state.missing.isLoading)
        .isError(store.state.missing.hasError)
        .background(Color.background)
        .navigationTitle("Missing near")
    }
}

struct MissingView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let store = storeBuilderFake()

        TabView {
            NavigationView { MissingView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .environmentObject(store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
