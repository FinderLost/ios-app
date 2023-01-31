//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Module Login
enum Login {
    struct State {
        var token: String = ""
        var error: String = ""
        var submodule: Submodule.State = .init()
    }
    enum Action {
        case checkLogin(Result<String, Error>)
        case checkAsync(String)
        case submodule(Submodule.Action)
    }
}
