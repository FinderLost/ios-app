//
//  HomeView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Redux
import SwiftUI

struct HomeView: View {
    @EnvironmentObject
    var store: Store<FinderLost>

    var body: some View {
        ZStack {
            Text("Missing near")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.background)
        .navigationTitle("Missing near")
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("Default preview")
    }
}
