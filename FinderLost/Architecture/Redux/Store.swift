//
//  Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

// MARK: - ARCHITECTURE OK - Store
typealias Store<_Reducer: ReducerBase> = StoreImpl<_Reducer.State, _Reducer.Action>
final class StoreImpl<State, Action>: ObservableObject {
    @Published var state: State
    private let reducer: Reducer<State, Action>
    private var handlers: [Handler<State, Action>] = []
    private var cancellables: [AnyCancellable] = []

    init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>
    ) {
        self.state = initialState
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        handlers.forEach { handler in
            handler(action, state)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }

        state = reducer(action, state)
    }

    @discardableResult
    func use(_ handler: Handler<State, Action>...) -> Self {
        handlers += handler
        return self
    }
}
