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

        case let .checkAsync(token):
            return Future { promise in
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    promise(.success(.checkLogin(.success("Middlewarer \(token)"))))
                }
            }.eraseToAnyPublisher()

        default: return Empty().eraseToAnyPublisher()
        }
    }
}
