//
//  ContainerDI.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import Data
import Domain

import Factory

extension Container {
    static let userRepository = Factory<UserRepository>(scope: .singleton) { UserRepositoryImpl() }
}
