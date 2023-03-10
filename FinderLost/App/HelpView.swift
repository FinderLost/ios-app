//
//  HelpView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        ZStack {
            Text("Help View view is in progress")
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.specific(.background))
            .navigationTitle("Help")
    }
}

#if DEBUG
struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        TabView {
            NavigationView { HelpView() }
                .tabItem { Image(systemName: "square.split.2x2.fill") }
        }
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("HelpView")
    }
}
#endif
