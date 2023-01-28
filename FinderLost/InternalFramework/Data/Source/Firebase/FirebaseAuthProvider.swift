//
//  FirebaseAuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import Combine

protocol FirebaseAuthProvider {
    func currentUserPublisher(credential: Void) -> AnyPublisher<Void?, Error>
}

class FirebaseAuthProviderImpl: FirebaseAuthProvider {
    func currentUserPublisher(credential: Void) -> AnyPublisher<Void?, Error> {
        Future { promise in
        }.eraseToAnyPublisher()
    }
}
