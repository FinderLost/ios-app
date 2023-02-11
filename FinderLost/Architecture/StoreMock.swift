//
//  StoreMock.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import Redux
import SwiftUI

extension PreviewProvider {
    static var storeMock: Store<FinderLost> {
        StoreImpl(
            initialState: FinderLost.State(),
            reducer: FinderLost.reduce,
            context: FinderLost.context
        )
    }
}
