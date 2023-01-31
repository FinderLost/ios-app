//
//  LoginReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Login Reducer
extension Login: ReducerBase {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .result(.checkSession(.success(value))):
            newState.userId = value
        case let .result(.checkSession(.failure(error))):
            newState.error = error.localizedDescription
        case let .submodule(.checkSubmodule(value)):
            newState.error = value
        case let .submodule(action):
            newState.submodule = Submodule.reduce(action, with: state.submodule)
        default: break
        }
        return newState
    }
}
