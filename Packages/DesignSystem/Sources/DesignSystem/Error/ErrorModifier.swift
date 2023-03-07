//
//  ErrorView.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//

import SwiftUI

extension View {
    public func isError(_ error: String?, action: (() -> Void)? = nil) -> some View {
        modifier(ErrorModifier(error: error, action: action))
    }
}

private struct ErrorModifier: ViewModifier {
    let error: String?
    let action: (() -> Void)?

    func body(content: Content) -> some View {
        if let error {
            content
                .blur(radius: 3)
                .overlay {
                    ErrorView(error: error)
                        .onTapGesture { action?() }
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
                Spacer()
                Text(error)
                    .font(.headline)
                    .padding(.leading, 16)
                    .foregroundColor(Color.text(.inverse))
                Image(systemName: "xmark.circle")
                    .padding(.leading, 8)
                    .padding(.trailing, 16)
                    .foregroundColor(Color.content(.inverse))
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .padding(.vertical, 16)
            .background(Color.status(.error))
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
