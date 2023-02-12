//
//  GoogleAuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 8/2/23.
//

import Domain
import Utilities

import Combine

import Factory

import Firebase
import GoogleSignIn

protocol GoogleAuthProviderI {
    func getCredential(userSession: UserSession) -> AuthCredential
    func signIn() -> AnyPublisher<UserSession, Error>
    func getInfo() -> AnyPublisher<Domain.UserInfo, Error>
}

final class GoogleAuthProviderImpl: GoogleAuthProviderI {
    @Injected(Container.firebaseApp)
    private var firebaseApp: FirebaseApp?
    @Injected(Container.googleSignIn)
    private var googleSignIn: GIDSignIn

    func signIn() -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            guard let clientID = self.firebaseApp?.options.clientID else { return }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            self.googleSignIn.configuration = config

            // Start the sign in flow!
            self.googleSignIn.signIn(
                withPresenting: UIApplication.shared.firstRootViewController ?? .init()
            ) { result, error in
                if let error {
                    promise(.failure(error))
                }

                if
                    let user = result?.user,
                    let userId = user.idToken?.tokenString {
                    let userSession = UserSessionImpl(
                        token: user.accessToken.tokenString,
                        userId: userId
                    )
                    promise(.success(userSession))
                }
            }
        }.eraseToAnyPublisher()
    }

    func getCredential(userSession: UserSession) -> AuthCredential {
        GoogleAuthProvider.credential(
            withIDToken: userSession.userId,
            accessToken: userSession.token
        )
    }

    func getInfo() -> AnyPublisher<Domain.UserInfo, Error> {
        Future { [weak self] promise in
            guard let profile = self?.googleSignIn.currentUser?.profile else { return }
            let user = UserInfoImpl(
                name: profile.name,
                email: profile.email
            )
            promise(.success(user))
        }.eraseToAnyPublisher()
    }
}
