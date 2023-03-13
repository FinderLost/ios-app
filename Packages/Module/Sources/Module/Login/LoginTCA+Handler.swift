//
//  LoginTCA+Handler.swift
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
                // MARK: - Call getInfo
            case .getInfo:
                return userRepository.getInfo()
                    .map { LoginTCA.Action.setInfo(.success($0)) }
                    .catch { Just(LoginTCA.Action.setInfo(.failure($0))) }
                    .eraseToAnyPublisher()

                // MARK: - Call signIn
            case .getSignIn:
                return userRepository.signIn()
                    .map { LoginTCA.Action.setSignIn(.success($0)) }
                    .catch { Just(LoginTCA.Action.setSignIn(.failure($0))) }
                    .eraseToAnyPublisher()

                // MARK: - Call restorePreviousSignIn
            case .getUserSession:
                return userRepository.restorePreviousSignIn()
                    .map { LoginTCA.Action.setUserSession(.success($0)) }
                    .catch { Just(LoginTCA.Action.setUserSession(.failure($0))) }
                    .eraseToAnyPublisher()

                // MARK: - Call signOut
            case .getSignOut:
                return userRepository.signOut()
                    .map { LoginTCA.Action.setSignOut(.success($0)) }
                    .catch { Just(LoginTCA.Action.setSignOut(.failure($0))) }
                    .eraseToAnyPublisher()

                // MARK: - Trigger getInfo
            case .setSignIn(.success), .setUserSession(.success):
                return Just(LoginTCA.Action.getInfo)
                    .eraseToAnyPublisher()

                // MARK: - Trigger getSignOut
            case .setUserSession(.failure):
                return Just(LoginTCA.Action.getSignOut)
                    .eraseToAnyPublisher()

                // MARK: - Return nil
            case
                    .setSignIn(.failure),
                    .setSignOut,
                    .setInfo:
                return nil
            }
        }
    }
}
