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
             case .getUserSession:
                return userRepository.getUserSession()
                    .compactMap { Login.Action.getUserSessionResult(.success($0)) }
                    .catch { Just(Login.Action.getUserSessionResult(.failure($0))) }
                    .eraseToAnyPublisher()
            default: return Empty().eraseToAnyPublisher()
            }
        }
    }
}
