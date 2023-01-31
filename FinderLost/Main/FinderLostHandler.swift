//
//  FinderLostHandler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

// MARK: - FinderLost Handler
extension FinderLost: HandlerBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never> {
        switch action {
        case let .login(action):
            return Login
                .handle(action, with: state.login)
                .map(Action.login)
                .eraseToAnyPublisher()
        }
    }
}
