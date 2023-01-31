//
//  LoginHandler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Foundation

// MARK: - Login Handler
extension Login: HandlerBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never> {
        switch action {
        case let .submodule(action):
            return Submodule.handle(action, with: state.submodule)
                .map(Action.submodule)
                .eraseToAnyPublisher()

        case .checkSession:
            return FirebaseAuthProviderImpl()
                .currentUserPublisher()
                .map { Action.result(.checkSession(.success($0))) }
                .catch { Just(Action.result(.checkSession(.failure($0)))) }
                .eraseToAnyPublisher()
        default: return Empty().eraseToAnyPublisher()
        }
    }
}
