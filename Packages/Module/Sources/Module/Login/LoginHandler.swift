//
//  LoginHandler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux
import Domain

import Combine
import Factory

extension LoginTCA {
    public class HandlerImpl<Action: ReduxAction, State: ReduxState>: Handler {
        private let userRepository: UserRepository

        public init(userRepository: UserRepository) {
            self.userRepository = userRepository
        }

        public func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never>? {
            guard let action = context.action as? LoginTCA.Action else { return nil }
            switch action {

            case .setSignIn(.success),
                    .setUserSession(.success),
                    .getInfo:
                return userRepository.getInfo()
                    .compactMap { LoginTCA.Action.setInfo(.success($0)) }
                    .catch { Just(LoginTCA.Action.setInfo(.failure($0))) }
                    .eraseToAnyPublisher()

            case .getSignIn:
                return userRepository.signIn()
                    .compactMap { LoginTCA.Action.setSignIn(.success($0)) }
                    .catch { Just(LoginTCA.Action.setSignIn(.failure($0))) }
                    .eraseToAnyPublisher()

            case .getUserSession:
                return userRepository.restorePreviousSignIn()
                    .map { LoginTCA.Action.setUserSession(.success($0)) }
                    .catch { Just(LoginTCA.Action.setUserSession(.failure($0))) }
                    .eraseToAnyPublisher()

            case .getSignOut, .setUserSession(.failure):
                return userRepository.signOut()
                    .map { LoginTCA.Action.setSignOut(.success($0)) }
                    .catch { Just(LoginTCA.Action.setSignOut(.failure($0))) }
                    .eraseToAnyPublisher()

            case
                    .setSignIn(.failure),
                    .setSignOut,
                    .setInfo:
                return nil
            }
        }
    }
}
