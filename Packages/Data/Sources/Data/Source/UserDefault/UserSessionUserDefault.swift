//
//  UserSessionUserDefault.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 26/1/23.
//

import Domain
import Utilities

public protocol UserSessionUserDefault {
    func get() -> UserSession?
    func delete()
    func save(userSession: UserSession)
}

public final class UserSessionUserDefaultImpl: UserSessionUserDefault {
    @UserDefault("userId", defaultValue: "")
    var userId: String
    @UserDefault("sessionToken", defaultValue: "")
    var sessionToken: String

    public init() { }
    
    public func get() -> UserSession? {
        guard sessionToken.isNotEmpty, userId.isNotEmpty else { return nil }
        return UserSessionImpl(
            token: sessionToken,
            userId: userId
        )
    }

    public func delete() {
        userId = ""
        sessionToken = ""
    }

    public func save(userSession: UserSession) {
        userId = userSession.userId
        sessionToken = userSession.token
    }
}
