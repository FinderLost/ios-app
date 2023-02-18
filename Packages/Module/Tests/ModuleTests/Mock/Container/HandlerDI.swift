//
//  HandlerDI.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Factory

class HandlerDI: SharedContainer {
    static let login = Factory<HandlerOf<Login>>(scope: .singleton) {
        Login.HandlerImpl(
            userRepository: RepositoryDI.user()
        )
    }
}
