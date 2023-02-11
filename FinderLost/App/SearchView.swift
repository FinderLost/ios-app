//
//  SearchView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import SwiftUI

struct SearchView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        Text("SearchView")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(store: storeMock)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
