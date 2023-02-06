//
//  FirebaseAuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import Factory

import Combine

import Firebase
import GoogleSignIn

protocol FirebaseAuthProvider {
    func currentUserPublisher() -> AnyPublisher<String, Error>
}

class FirebaseAuthProviderImpl: FirebaseAuthProvider {
    @Injected(Container.firebaseApp)
    private var firebaseApp: FirebaseApp?
    @Injected(Container.firebaseAuth)
    private var firebaseAuth: Auth
    @Injected(Container.googleSignIn)
    private var googleSignIn: GIDSignIn

    func currentUserPublisher() -> AnyPublisher<String, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            let credential = GoogleAuthProvider.credential(
                withIDToken: "idToken",
                accessToken: "user.accessToken.tokenString"
            )
            self.firebaseAuth.signIn(with: credential) { result, error in
                if let result {
                    promise(.success("\(result)"))
                }
                if let error {
                    promise(.failure(error))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
