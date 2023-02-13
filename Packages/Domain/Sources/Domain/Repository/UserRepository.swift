//
//  UserRepository.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Combine

public protocol UserRepository {
    func restorePreviousSignIn() -> AnyPublisher<UserSession, Error>
    func signIn() -> AnyPublisher<UserSession, Error>
    func signOut() -> AnyPublisher<Void, Error>
    func getInfo() -> AnyPublisher<UserInfo, Error>
}
