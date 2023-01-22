//
//  Reducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

typealias Reducer<State, Action> = (State, Action) -> State

@discardableResult
func appReducer(state: AppState, action: AppAction) -> AppState {
    var newState = state
    switch action {
    case let .updateUserName(name):
        newState.userName = name
    case let .updateUserEmail(email):
        newState.userEmail = email
    }
    return newState
}
