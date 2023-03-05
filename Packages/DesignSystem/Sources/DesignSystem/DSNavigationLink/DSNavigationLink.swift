//
//  DSNavigationLink.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 5/3/23.
//

import SwiftUI

public struct DSNavigationLink<Label, Destination> : View where Label : View, Destination : View {
    let destination: Destination
    let label: () -> Label

    public init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.destination = destination
        self.label = label
    }

    public var body: some View {
        ZStack {
            NavigationLink(destination: destination) { EmptyView() }.opacity(.zero)
            label()
        }
    }
}
