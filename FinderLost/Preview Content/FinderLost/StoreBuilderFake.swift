//
//  ContainerDI+Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Redux

extension PreviewContent {
    static func storeBuilderFake(
        initialState: FinderLost.State = .init(),
        reducer: @escaping Reduce<FinderLost.Action, FinderLost.State> = FinderLost.reduce,
        context: @escaping Context<FinderLost.Action, FinderLost.State> = FinderLost.context
    ) -> Store<FinderLost> {
        StoreImpl(
            initialState: initialState,
            reducer: reducer,
            context: context
        )
    }
}
