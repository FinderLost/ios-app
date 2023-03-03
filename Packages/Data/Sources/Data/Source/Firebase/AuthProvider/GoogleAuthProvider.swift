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
    func restorePreviousSignIn() -> AnyPublisher<AuthCredential, Error>
    func signIn() -> AnyPublisher<AuthCredential, Error>
    func signOut() -> AnyPublisher<Void, Error>
    func getInfo() -> AnyPublisher<Domain.UserInfo, Error>
}

final class GoogleAuthProviderImpl: GoogleAuthProviderI {
    @Injected(FirebaseDI.firebaseApp)
    private var firebaseApp: FirebaseApp?
    @Injected(FirebaseDI.googleSignIn)
    private var googleSignIn: GIDSignIn

    func signIn() -> AnyPublisher<AuthCredential, Error> {
        Future { [weak self] promise in
            guard
                let googleSignIn = self?.googleSignIn,
                let clientID = self?.firebaseApp?.options.clientID
            else {
                promise(.failure(CustomError.isEmpty))
                return
            }

            let config = GIDConfiguration(clientID: clientID)
            googleSignIn.configuration = config

            googleSignIn.signIn(
                withPresenting: UIApplication.shared.firstRootViewController ?? .init()
            ) { result, error in
                if let error { promise(.failure(error)) }
                if let credential = result?.user.credential { promise(.success(credential)) }
            }
        }.eraseToAnyPublisher()
    }

    func getInfo() -> AnyPublisher<Domain.UserInfo, Error> {
        Future { [weak self] promise in
            guard let profile = self?.googleSignIn.currentUser?.profile else {
                promise(.failure(CustomError.isEmpty))
                return
            }
            let user = UserInfoImpl(
                name: profile.name,
                email: profile.email,
                imageUrl: profile.imageURL(withDimension: 80)
            )
            promise(.success(user))
        }.eraseToAnyPublisher()
    }

    func restorePreviousSignIn() -> AnyPublisher<AuthCredential, Error> {
        Future { promise in
            GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                if let error { promise(.failure(error)) }
                if let credential = user?.credential { promise(.success(credential)) }
            }
        }.eraseToAnyPublisher()
    } 

    func signOut() -> AnyPublisher<Void, Error> {
        Future { promise in
            GIDSignIn.sharedInstance.signOut()
            promise(.success(()))
        }.eraseToAnyPublisher()
    }
}

private extension GIDGoogleUser {
    var credential: AuthCredential? {
        guard let idToken = idToken?.tokenString else { return nil }
        return GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: accessToken.tokenString
        )
    }
}
