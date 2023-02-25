//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Domain

import UIKit

public enum Login {
    public struct Data: ReduxState {
        public var email: String
        public var name: String
        public var imageUrl: URL?
        public init(
            email: String,
            name: String,
            imageUrl: URL?
        ) {
            self.email = email
            self.name = name
            self.imageUrl = imageUrl
        }
    }
    public enum State: ReduxState {
        case idle
        case signIn(Data)
        case signOut
        case loading
        case failed(String)

        public var isLoading: Bool {
            if case .loading = self { return true }
            return false
        }
        public var isSignIn: Bool {
            if case .signIn = self { return true }
            return false
        }
        public var isSignOut: Bool {
            if case .signOut = self { return true }
            return false
        }
        public var hasData: Data? {
            guard case let .signIn(state) = self else { return nil }
            return state
        }
        public var hasError: String? {
            guard case let .failed(error) = self else { return nil }
            return error
        }
    }
    public enum Action: ReduxAction {
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
