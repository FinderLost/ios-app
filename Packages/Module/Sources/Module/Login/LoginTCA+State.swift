//
//  LoginTCA+State.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Domain

import UIKit

public enum LoginTCA {
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
        case signIn(Data)
        case signOut
        case failed(String)
        case loading
        case idle

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
}
