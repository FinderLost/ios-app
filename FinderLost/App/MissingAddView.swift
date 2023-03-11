//
//  MissingAdd.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

struct MissingAddView: View {
    var body: some View {
        ZStack {
            Text("Missing Add view is in progress")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.specific(.background))
            .navigationTitle("Add a new Missing")
    }
}

#if DEBUG
struct MissingAdd_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView { MissingAddView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("MissingAddView")
    }
}
#endif
