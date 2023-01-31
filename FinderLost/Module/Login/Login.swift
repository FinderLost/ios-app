//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Module Login
enum Login {
    struct State {
        var userId: String = ""
        var tokenSession: String = ""
        var error: String = ""
        var submodule: Submodule.State = .init()
    }
    enum ResultAction {
        case checkSession(Result<String, Error>)
    }
    enum Action {
        case result(ResultAction)
        case checkSession
        case submodule(Submodule.Action)
    }
}
