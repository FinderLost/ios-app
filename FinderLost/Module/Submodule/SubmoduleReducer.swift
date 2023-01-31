//
//  SubmoduleReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Submodule Reducer
extension Submodule: ReducerBase {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .checkSubmodule(value):
            newState.value = value
        default: break
        }
        return newState
    }
}
