//
//  ContainerDI+AuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

import Factory

final class AuthProviderDI: SharedContainer {
    static let firebase = Factory<FirebaseAuthProvider>(scope: .singleton) {
        FirebaseAuthProviderImpl()
    }
    static let google = Factory<GoogleAuthProviderI>(scope: .singleton) {
        GoogleAuthProviderImpl()
    }
}
