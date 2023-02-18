//
//  StateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Module
import Utilities

extension FinderLost {
    struct StateBuilderFake: Modifiable {
        var login: Login.State = .signOut

        var entity: FinderLost.State {
            .init(
                login: login
            )
        }
    }
}
