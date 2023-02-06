//
//  LoginHandler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Factory

extension Login {
    class HandlerImpl<Action: ReduxAction, State>: Handler {
        @Injected(Container.userRepository)
        private var userRepository: UserRepository

        func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never> {
            guard let action = context.action as? Login.Action else { return Empty().eraseToAnyPublisher() }
            switch action {
            case .checkSession:
                return userRepository.checkSession()
                    .compactMap { Login.Action.checkSessionResult(.success($0)) }
                    .catch { Just(Login.Action.checkSessionResult(.failure($0))) }
                    .eraseToAnyPublisher()
            default: return Empty().eraseToAnyPublisher()
            }
        }
    }
}
