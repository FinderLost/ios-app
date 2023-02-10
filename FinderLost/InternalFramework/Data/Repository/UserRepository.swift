//
//  UserRepository.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Factory

import Firebase
import GoogleSignIn

protocol UserRepository {
    func getSession() -> AnyPublisher<UserSession, Error>
    func signIn() -> AnyPublisher<UserSession, Error>
    func signOut() -> AnyPublisher<Void, Error>
}

class UserRepositoryImpl: UserRepository {
    @Injected(Container.userSessionUserDefault)
    private var userSessionUserDefault: UserSessionUserDefault

    @Injected(Container.firebaseAuthProvider)
    private var firebaseAuthProvider: FirebaseAuthProvider
    @Injected(Container.googleAuthProvider)
    private var googleAuthProvider: GoogleAuthProviderI

    func getSession() -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            guard
                self.userSessionUserDefault.sessionToken.isNotEmpty,
                self.userSessionUserDefault.userId.isNotEmpty
            else { return promise(.failure(CError.isEmpty)) }
            let userSession = UserSessionImpl(
                token: self.userSessionUserDefault.sessionToken,
                userId: self.userSessionUserDefault.userId
            )
            promise(.success(userSession))
        }.eraseToAnyPublisher()
    }

    func signOut() -> AnyPublisher<Void, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            self.userSessionUserDefault.userId = ""
            self.userSessionUserDefault.sessionToken = ""
            promise(.success(()))
        }.eraseToAnyPublisher()
    }

    func signIn() -> AnyPublisher<UserSession, Error> {
        signInWithGoogle()
            .flatMap(saveSession)
            .eraseToAnyPublisher()
    }

    private func saveSession(_ userSession: UserSession) -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            self.userSessionUserDefault.userId = userSession.userId
            self.userSessionUserDefault.sessionToken = userSession.token
            promise(.success(userSession))
        }.eraseToAnyPublisher()
    }

    private func signInWithGoogle() -> AnyPublisher<UserSession, Error> {
        googleAuthProvider.signIn()
            .map(googleAuthProvider.getCredential)
            .flatMap(firebaseAuthProvider.signIn)
            .eraseToAnyPublisher()
    }
}
