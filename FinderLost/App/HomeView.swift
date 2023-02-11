//
//  HomeView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import SwiftUI

struct HomeView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        Text("HomeView")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(store: storeMock)
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
