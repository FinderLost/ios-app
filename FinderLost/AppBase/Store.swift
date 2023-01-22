//
//  Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import Combine

class Store<State, Action>: ObservableObject {
    @Published var state: State
    private let reducer: Reducer<State, Action>

    init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>
    ) {
        self.state = initialState
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        state = reducer(state, action)
    }
}
