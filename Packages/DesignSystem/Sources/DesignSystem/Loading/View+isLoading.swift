//
//  File.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import SwiftUI

extension View {
    public func isLoading(_ loading: Bool) -> some View {
        modifier(Loader(isLoading: loading))
    }
}

private struct Loader: ViewModifier {
    var isLoading: Bool

    func body(content: Content) -> some View {
        if isLoading {
            content
                .blur(radius: 3)
                .overlay {
                    ProgressView()
                }
        } else {
            content
        }
    }
}
