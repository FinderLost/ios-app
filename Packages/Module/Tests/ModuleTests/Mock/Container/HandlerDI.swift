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
    static let login = Factory<HandlerOf<Login>>(scope: .test) {
        Login.HandlerImpl(
            userRepository: RepositoryDI.user()
        )
    }
}
