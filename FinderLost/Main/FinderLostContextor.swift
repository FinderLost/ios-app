//
//  FinderLostContextor.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Module

extension FinderLost: Contextor {
    static func context(_ action: Action, with state: State) -> any HandlerContext {
        switch action {
        case let .login(action):
            return HandlerContextImpl(action: action, state: state.login, next: Action.login)
        case let .missing(action):
            return HandlerContextImpl(action: action, state: state.missing, next: Action.missing)
        }
    }
}
