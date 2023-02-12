//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Domain
import UIKit
enum Login {
    struct SignIn: Codable {
        var userId: String
        var email: String
        var name: String
        var imageUrl: URL?
    }
    // TODO: - Update the redux architecture to implement the State as Codable by default
    enum State: Codable {
        case idle
        case signIn(SignIn)
        case signOut
        case loading

        var isLoading: Bool {
            if case .loading = self { return true }
            return false
        }
        var isSignIn: Bool {
            if case .signIn = self { return true }
            return false
        }
        var isSignOut: Bool {
            if case .signOut = self { return true }
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
