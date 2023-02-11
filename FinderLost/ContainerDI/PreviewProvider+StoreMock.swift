//
//  ContainerDI+Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Redux
import SwiftUI
import Factory

extension PreviewProvider {
    static var storeMock: Store<FinderLost> {
        StoreImpl(
            initialState: FinderLost.State(),
            reducer: FinderLost.reduce,
            context: FinderLost.context
        )
    }
}
