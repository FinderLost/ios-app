//
//  ContainerDI+AuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

import Factory

extension Container {
    static let firebaseAuthProvider = Factory<FirebaseAuthProvider>(scope: .singleton) {
        FirebaseAuthProviderImpl()
    }
    static let googleAuthProvider = Factory<GoogleAuthProviderI>(scope: .singleton) {
        GoogleAuthProviderImpl()
    }
}
