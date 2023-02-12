//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Domain

enum Login {
    struct SignIn {
        var userId: String
        var email: String
        var name: String
    }
    enum State {
        case idle
        case signIn(SignIn)
        case signOut
        case loading

        var isLoading: Bool {
            if case .loading = self { return true }
            return false
        }
        var lastSignIn: SignIn? {
            guard case let .signIn(state) = self else { return nil }
            return state
        }
    }
    enum Action: ReduxAction {
        case getUserSession
        case getUserSessionResult(Result<UserSession, Error>)
        case signIn
        case signInResult(Result<UserSession, Error>)
        case signOut
        case signOutResult(Result<Void, Error>)
        case getInfo
        case getInfoResult(Result<UserInfo, Error>)
    }
}
