//
//  MissingItemView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

struct MissingItemView: View {
    let headline: String
    let subheadline: String

    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: .spacingXS) {
                Text(headline)
                    .font(.headline)
                Text(subheadline)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.spacingS)
        }
        .background(Color.specific(.surface))
        .cornerRadius(.cornerRadiusL)
    }
}

#if DEBUG
struct MissingItemView_Previews: PreviewProvider, PreviewContent {
    static var previews: some View {
        MissingItemView(headline: "headline", subheadline: "subheadline")
            .previewLayout(PreviewLayout.sizeThatFits)
            .previewDisplayName("MissingItemView")
    }
}
#endif
