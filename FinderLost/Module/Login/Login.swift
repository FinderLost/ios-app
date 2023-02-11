//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Domain

enum Login {
    struct State {
        var userId: String?
        var email: String?
        var hasSession: Bool { userId.isNotNil }
    }
    enum Action: ReduxAction {
        case getUserSession
        case getUserSessionResult(Result<UserSession, Error>)
        case signIn
        case signInResult(Result<UserSession, Error>)
        case signOut
        case signOutResult(Result<Void, Error>)
    }
}

