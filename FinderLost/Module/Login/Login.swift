//
//  Login.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

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

public protocol AnyOptional {
    var isNil: Bool { get }
    var isNotNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
    public var isNotNil: Bool { self != nil }
}
