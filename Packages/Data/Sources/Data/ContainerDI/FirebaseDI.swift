//
//  ContainerDI+Firebase.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Factory

import Firebase
import GoogleSignIn

final class FirebaseDI: SharedContainer {
    static let firebaseApp = Factory<FirebaseApp?>(scope: .singleton) { FirebaseApp.app() }
    static let firebaseAuth = Factory<Auth>(scope: .singleton) { Auth.auth() }
    static let googleSignIn = Factory<GIDSignIn>(scope: .singleton) { GIDSignIn.sharedInstance }
}
