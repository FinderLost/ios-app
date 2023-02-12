//
//  ContainerDI+Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Redux
import Utilities

extension FinderLost {
    static func storeBuilderFake(
        initialState: FinderLost.State = .init(),
        reducer: @escaping Reduce<Action, State> = FinderLost.reduce,
        context: @escaping Context<Action, State> = FinderLost.context
    ) -> Store<FinderLost> {
        StoreImpl(
            initialState: initialState,
            reducer: reducer,
            context: context
        )
    }
}
