//
//  UserSessionUserDefault.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 26/1/23.
//

import Utilities

protocol UserSessionUserDefault {
    func get() -> UserSession?
    func delete()
    func save(userSession: UserSession)
}

final class UserSessionUserDefaultImpl: UserSessionUserDefault {
    @UserDefault("userId", defaultValue: "")
    var userId: String
    @UserDefault("sessionToken", defaultValue: "")
    var sessionToken: String

    func get() -> UserSession? {
        guard sessionToken.isNotEmpty, userId.isNotEmpty else { return nil }
        return UserSessionImpl(
            token: sessionToken,
            userId: userId
        )
    }

    func delete() {
        userId = ""
        sessionToken = ""
    }

    func save(userSession: UserSession) {
        userId = userSession.userId
        sessionToken = userSession.token
    }
}
