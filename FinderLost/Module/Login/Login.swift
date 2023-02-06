//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

enum Login {
    struct State {
        var userId: String = ""
        var error: String = ""
    }
    enum Action: ReduxAction {
        case checkSession
        case checkSessionResult(Result<String, Error>)
    }
}
