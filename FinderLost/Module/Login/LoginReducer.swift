//
//  LoginReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Login Reducer
extension Login: Reducer {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .checkSessionResult(.success(value)):
            newState.userId = value
        case let .checkSessionResult(.failure(error)):
            newState.error = error.localizedDescription
        default: break
        }
        return newState
    }
}
