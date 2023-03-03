//
//  UserRepository.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Domain

import Combine
import Factory

import Utilities

public final class UserRepositoryImpl: UserRepository {
    @Injected(AuthProviderDI.firebase)
    private var firebaseAuthProvider: FirebaseAuthProvider
    @Injected(AuthProviderDI.google)
    private var googleAuthProvider: GoogleAuthProviderI

    public init() { }

    public func restorePreviousSignIn() -> AnyPublisher<UserSession, Error> {
        googleAuthProvider.restorePreviousSignIn()
            .flatMap(firebaseAuthProvider.signIn)
            .eraseToAnyPublisher()
    }

    public func signIn() -> AnyPublisher<UserSession, Error> {
        googleAuthProvider.signIn()
            .flatMap(firebaseAuthProvider.signIn)
            .eraseToAnyPublisher()
    }

    public func signOut() -> AnyPublisher<Void, Error> {
        googleAuthProvider.signOut()
    }

    public func getInfo() -> AnyPublisher<UserInfo, Error> {
        googleAuthProvider.getInfo()
    }
}
