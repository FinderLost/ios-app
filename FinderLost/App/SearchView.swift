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
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        ZStack {
            Text("SearchView")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
