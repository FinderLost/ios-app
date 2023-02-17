//
//  HandlerDI.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 17/2/23.
//

import Redux
import Module

import Factory

class HandlerDI: SharedContainer {
    static let login = Factory<HandlerOf<FinderLost>>(scope: .singleton) {
        Login.HandlerImpl(
            userRepository: RepositoryDI.user()
        )
    }
}
