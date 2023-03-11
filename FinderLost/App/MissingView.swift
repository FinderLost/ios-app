//
//  MissingView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import DesignSystem

import SwiftUI

struct MissingView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        ZStack {
            if let publicList = store.state.missing.hasData?.publicList {
                List(publicList) { item in
                    DSNavigationLink(destination: MissingDetailView()) {
                        MissingItemView(
                            headline: item.name,
                            subheadline: item.description
                        )
                    }
                    .modifier(DSListItem())
                }
                .modifier(DSList())
            } else {
                ZStack {
                    Text("no missing yet")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.specific(.background))
        .navigationTitle("Missing near")
        .isLoading(store.state.missing.isLoading)
        .isError(store.state.missing.hasError)
        .refreshable { store.dispatch(.missing(.getMissingList)) }
        .navigationBarItems(
            trailing:
                HStack {
                    NavigationLink(destination: FilterView()) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    NavigationLink(destination: MissingAddView()) { Image(systemName: "plus") }
                }
        )
    }
}

#if DEBUG
struct MissingView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        let item = missingItemBuilderFake
            .entity

        let missingState = missingStateBuilderFake
            .set(\.publicList, [item, item, item, item])
            .entity

        let state = stateBuilderFake
            .set(\.missing, .loading)
            .set(\.missing, .failed("error"))
            .set(\.missing, .idle)
            .set(\.missing, .success(missingState))
            .entity

        let store = storeBuilderFake(
            initialState: state
        )

        TabView {
            NavigationView { MissingView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .environmentObject(store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("MissingView")
    }
}
#endif
