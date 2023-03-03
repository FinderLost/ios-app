//
//  FinderLostReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Module

extension FinderLost: Reducer {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .login(action): newState.login = Login.reduce(action, with: state.login)
        case let .missing(action): newState.missing = MissingTCA.reduce(action, with: state.missing)
        }
        return newState
    }
}
