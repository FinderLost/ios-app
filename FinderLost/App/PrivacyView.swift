//
//  PrivacyView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

struct PrivacyView: View {
    var body: some View {
        ZStack {
            Text("Privacy view is in progress")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.specific(.background))
            .navigationTitle("Privacy")
    }
}

struct PrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView { PrivacyView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("PrivacyView")
    }
}
