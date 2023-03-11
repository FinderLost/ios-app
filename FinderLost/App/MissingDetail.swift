//
//  MissingDetail.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

struct MissingDetailView: View {
    var body: some View {
        ZStack {
            Text("MissingDetail View view is in progress")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.specific(.background))
            .navigationTitle("MissingDetail")
    }
}

#if DEBUG
struct MissingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView { MissingDetailView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("MissingDetailView")
    }
}
#endif
