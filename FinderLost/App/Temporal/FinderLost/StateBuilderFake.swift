//
//  StateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Module
import Utilities

extension PreviewContent {
    static var stateBuilderFake: StateBuilderFake { .init() }
}

struct StateBuilderFake: Modifiable {
    var login: LoginTCA.State = .idle
    var missing: MissingTCA.State = .idle
    fileprivate init() { }
    
    var entity: FinderLost.State {
        .init(
            login: login,
            missing: missing
        )
    }
}
