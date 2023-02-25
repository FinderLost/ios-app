//
//  ErrorView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//

import SwiftUI

extension View {
    public func isError(_ error: String?) -> some View {
        modifier(ErrorModifier(error: error))
    }
}

private struct ErrorModifier: ViewModifier {
    let error: String?

    func body(content: Content) -> some View {
        if let error {
            content
                .blur(radius: 3)
                .overlay {
                    ErrorView(error: error)
                }
        } else {
            content
        }
    }
}

private struct ErrorView: View {
    let error: String

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Image(systemName: "info.circle")
                    .padding(.leading, 16)
                Text(error)
                    .font(.headline)
                    .padding(.leading, 8)
                    .padding(.trailing, 16)
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .background(Color.red)
            .cornerRadius(10)
        }
        .padding(16)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "error")
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
