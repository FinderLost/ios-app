//
//  SearchView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux

import Factory
import SwiftUI

struct SearchView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        Text("SearchView")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let store = FinderLost.storeBuilderFake()
        SearchView(store: store)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
