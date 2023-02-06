//
//  UserRepository.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Factory

protocol UserRepository {
    func checkSession() -> AnyPublisher<String, Error>
}

class UserRepositoryImpl: UserRepository {
    @Injected(Container.firebaseAuthProvider)
    private var firebaseAuthProvider: FirebaseAuthProvider
    
    func checkSession() -> AnyPublisher<String, Error> {
        firebaseAuthProvider.currentUserPublisher()
    }
}
