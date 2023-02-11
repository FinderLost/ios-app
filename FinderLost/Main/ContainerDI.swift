//
//  ContainerDI.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

import Redux

import Factory

import Combine

import Firebase
import GoogleSignIn

extension Container {
    static let firebaseApp = Factory<FirebaseApp?>(scope: .singleton) { FirebaseApp.app() }
    static let firebaseAuth = Factory<Auth>(scope: .singleton) { Auth.auth() }
    static let googleSignIn = Factory<GIDSignIn>(scope: .singleton) { GIDSignIn.sharedInstance }
}

extension Container {
    static let userRepository = Factory<UserRepository>(scope: .singleton) { UserRepositoryImpl() }
}

extension Container {
    static let loginHandler = Factory<HandlerOf<FinderLost>>(scope: .singleton) { Login.HandlerImpl() }
}

extension Container {
    static let firebaseAuthProvider = Factory<FirebaseAuthProvider>(scope: .singleton) {
        FirebaseAuthProviderImpl()
    }
    static let googleAuthProvider = Factory<GoogleAuthProviderI>(scope: .singleton) {
        GoogleAuthProviderImpl()
    }
}

extension Container {
    static let userSessionUserDefault = Factory<UserSessionUserDefault>(scope: .singleton) {
        UserSessionUserDefaultImpl()
    }
}
