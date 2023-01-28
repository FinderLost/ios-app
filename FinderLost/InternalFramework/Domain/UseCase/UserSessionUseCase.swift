//
//  UserSessionUseCase.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 26/1/23.
//

import Combine

protocol UserSessionUseCase {
    func checkSession(credential: Void) -> AnyPublisher<Void?, Error>
}

class UserSessionUseCaseImpl: UserSessionUseCase {
    private let firebaseAuthProvider: FirebaseAuthProvider

    init(firebaseAuthProvider: FirebaseAuthProvider) {
        self.firebaseAuthProvider = firebaseAuthProvider
    }

    func checkSession(credential: Void) -> AnyPublisher<Void?, Error> {
        firebaseAuthProvider.currentUserPublisher(credential: credential)
    }
}
