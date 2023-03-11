//
//  FilterView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        ZStack {
            Text("Filter view is in progress")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.specific(.background))
            .navigationTitle("Filter by category")
    }
}

#if DEBUG
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView { FilterView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("FilterView")
    }
}
#endif
