//
//  ContainerDI.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import Data
import Domain

import Factory

final class RepositoryDI: SharedContainer {
    static let user = Factory<UserRepository>(scope: .singleton) {
        UserRepositoryImpl()
    }
    static let missing = Factory<MissingRepository>(scope: .singleton) {
        MissingRepositoryImpl()
    }
}
