//
//  FirebaseAuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import Factory
import Combine
import Firebase

protocol FirebaseAuthProvider {
    func signIn(credential: AuthCredential) -> AnyPublisher<UserSession, Error>
}

class FirebaseAuthProviderImpl: FirebaseAuthProvider {
    @Injected(Container.firebaseAuth)
    private var firebaseAuth: Auth

    func signIn(credential: AuthCredential) -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            self.firebaseAuth.signIn(with: credential) { result, error in
                if let error {
                    promise(.failure(error))
                }
                if let result {
                    let userSession = UserSessionImpl(
                        token: result.user.providerID,
                        userId: result.additionalUserInfo?.providerID ?? ""
                    )
                    promise(.success(userSession))
                }
            }
        }.eraseToAnyPublisher()
    }
}
