//
//  FinderLost.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux

enum FinderLost {
    struct State {
        var login: Login.State = .init()
    }

    enum Action: ReduxAction {
        case login(Login.Action)
    }
}
