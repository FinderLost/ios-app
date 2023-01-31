//
//  FinderLostReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - FinderLost Reducer
extension FinderLost: ReducerBase {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .login(action):
            newState.login = Login.reduce(action, with: state.login)
        }
        return newState
    }
}
