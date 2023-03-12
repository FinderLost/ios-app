//
//  ReduxMock.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/3/23.
//

import Redux

// MARK: - State and Action
enum ReduxMock {
    struct State: ReduxState {
        var module: ModuleMock.State
    }
    enum Action: ReduxAction {
        case module(ModuleMock.Action)
    }
}

// MARK: - reduce
extension ReduxMock: Reducer {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .module(action): newState.module = ModuleMock.reduce(action, with: state.module)
        }
        return newState
    }
}

// MARK: - context
extension ReduxMock: Contextor {
    static func context(_ action: Action, with state: State) -> any HandlerContext {
        switch action {
        case let .module(action):
            return HandlerContextImpl(action: action, state: state.module, next: ReduxMock.Action.module)
        }
    }
}
