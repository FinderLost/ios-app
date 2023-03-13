//
//  UserRepositoryMock.swift
//
//
//  Created by Andres Felipe Alzate Restrepo on 15/2/23.
//

import Domain
import Combine
import Utilities

final class UserRepositoryMock: UserRepository, Modifiable {
    var userSession: UserSession = UserSessionBuilderFake().entity
    var userInfo: UserInfo = UserInfoBuilderFake().entity

    var underlyingRestorePreviousSignIn: AnyPublisher<UserSession, Error>!
    func restorePreviousSignIn() -> AnyPublisher<UserSession, Error> {
        underlyingRestorePreviousSignIn
    }

    var underlyingSignIn: AnyPublisher<UserSession, Error>!
    func signIn() -> AnyPublisher<UserSession, Error> {
        underlyingSignIn
    }

    var underlyingSignOut: AnyPublisher<Void, Error>!
    func signOut() -> AnyPublisher<Void, Error> {
        underlyingSignOut
    }

    var underlyingGetInfo: AnyPublisher<UserInfo, Error>!
    func getInfo() -> AnyPublisher<UserInfo, Error> {
        underlyingGetInfo
    }
}
