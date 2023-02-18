//
//  RepositoryDI.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 17/2/23.
//

import Domain

import Factory

final class RepositoryDI: SharedContainer {
    static let user = Factory<UserRepository>(scope: .singleton) {
        UserRepositoryMock()
    }
}
