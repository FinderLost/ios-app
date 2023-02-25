//
//  StateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Module
import Utilities

extension PreviewContent {
    static var stateBuilderFake: BuilderFake.FinderLostBF.StateBuilderFake { .init() }
}

extension BuilderFake {
    enum FinderLostBF {
        struct StateBuilderFake: Modifiable {
            var login: Login.State = .idle
            var missing: Missing.State = .idle

            var entity: FinderLost.State {
                .init(
                    login: login,
                    missing: missing
                )
            }
        }
    }
}
