//
//  FinderLost.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Module FinderLost
enum FinderLost {
    struct State {
        var login: Login.State = .init()
    }

    enum Action {
        case login(Login.Action)
    }
}
