//
//  LoginReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

extension Login: Reducer {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state

        switch action {
        case
            let .getUserSessionResult(.success(value)),
            let .signInResult(.success(value)):
            newState.userId = value.userId

        case
                .getUserSessionResult(.failure),
                .signInResult(.failure),
                .signOutResult(.success):
            newState.userId = nil

        default: break
        }

        return newState
    }
}
