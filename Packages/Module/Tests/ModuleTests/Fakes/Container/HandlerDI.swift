//
//  HandlerDI.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Redux
import Module

import Factory

class HandlerDI: SharedContainer {
    static let login = Factory<HandlerOf<LoginTCA>>(scope: .test) {
        LoginTCA.HandlerImpl(
            userRepository: RepositoryDI.user()
        )
    }
    static let missing = Factory<HandlerOf<MissingTCA>>(scope: .test) {
        MissingTCA.HandlerImpl(
            missingRepository: RepositoryDI.missing()
        )
    }
}
