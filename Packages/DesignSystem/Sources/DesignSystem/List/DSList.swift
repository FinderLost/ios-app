//
//  DSList.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

public struct DSList: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .scrollContentBackground(.hidden)
            .listStyle(.inset)
    }
}
