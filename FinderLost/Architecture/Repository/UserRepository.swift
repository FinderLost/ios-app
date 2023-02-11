//
//  UserRepository.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Domain

import Combine
import Factory

import Firebase
import GoogleSignIn

final class UserRepositoryImpl: UserRepository {
    @Injected(Container.userSessionUserDefault)
    private var userSessionUserDefault: UserSessionUserDefault

    @Injected(Container.firebaseAuthProvider)
    private var firebaseAuthProvider: FirebaseAuthProvider
    @Injected(Container.googleAuthProvider)
    private var googleAuthProvider: GoogleAuthProviderI

    func getSession() -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            guard let userSession = self.userSessionUserDefault.get() else {
                return promise(.failure(CustomError.isEmpty))
            }
            promise(.success(userSession))
        }.eraseToAnyPublisher()
    }

    func signOut() -> AnyPublisher<Void, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            self.userSessionUserDefault.delete()
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
            self.userSessionUserDefault.save(userSession: userSession)
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
