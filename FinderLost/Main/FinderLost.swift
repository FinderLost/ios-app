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
        var login: Login.State = .idle
        var missing: Missing.State = .idle
    }

    enum Action: ReduxAction {
        case login(Login.Action)
        case missing(Missing.Action)
    }
}
