//
//  DSListItem.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import SwiftUI

public struct DSListItem: ViewModifier {
    public init() {}
    public func body(content: Content) -> some View {
        content
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
}
