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
        reducer: @escaping Reduce<FinderLost.Action, FinderLost.State> = FinderLost.fakeReduce,
        context: @escaping Context<FinderLost.Action, FinderLost.State> = FinderLost.fakeContext
    ) -> Store<FinderLost> {
        StoreImpl(
            initialState: initialState,
            reducer: reducer,
            context: context
        )
    }
}

private extension FinderLost {
    static func fakeContext(_ action: Action, with state: State) -> any HandlerContext {
        HandlerContextImpl(action: FinderLost.Action.login(.getInfo), state: state) { $0 }
    }
    static func fakeReduce(_ action: Action, with state: State) -> State { state }
}
