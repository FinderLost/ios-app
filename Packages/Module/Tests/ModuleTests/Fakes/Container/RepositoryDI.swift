//
//  RepositoryDI.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 17/2/23.
//

import Domain

import Factory

final class RepositoryDI: SharedContainer {
    static let user = Factory<UserRepository>(scope: .test) {
        UserRepositoryMock()
    }
    static let missing = Factory<MissingRepository>(scope: .test) {
        MissingRepositoryMock()
    }
}
