//
//  FinderLost.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Module

enum FinderLost {
    struct State: ReduxState {
        var login: LoginTCA.State = .idle
        var missing: MissingTCA.State = .idle
    }

    enum Action: ReduxAction {
        case login(LoginTCA.Action)
        case missing(MissingTCA.Action)
    }
}
