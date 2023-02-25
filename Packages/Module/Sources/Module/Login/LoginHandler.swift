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

extension Login {
    public class HandlerImpl<Action: ReduxAction, State: ReduxState>: Handler {
        private let userRepository: UserRepository

        public init(userRepository: UserRepository) {
            self.userRepository = userRepository
        }

        public func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never> {
            guard let action = context.action as? Login.Action else { return Empty().eraseToAnyPublisher() }
            switch action {

            case .signInResult(.success),
                    .getUserSessionResult(.success),
                    .getInfo:
                return userRepository.getInfo()
                    .compactMap { Login.Action.getInfoResult(.success($0)) }
                    .catch { Just(Login.Action.getInfoResult(.failure($0))) }
                    .eraseToAnyPublisher()

            case .signIn:
                return userRepository.signIn()
                    .compactMap { Login.Action.signInResult(.success($0)) }
                    .catch { Just(Login.Action.signInResult(.failure($0))) }
                    .eraseToAnyPublisher()

            case .getUserSession:
                return userRepository.restorePreviousSignIn()
                    .map { Login.Action.getUserSessionResult(.success($0)) }
                    .catch { Just(Login.Action.getUserSessionResult(.failure($0))) }
                    .eraseToAnyPublisher()

            case .signOut, .getUserSessionResult(.failure):
//                return userRepository.signOut()
                return Just(()).setFailureType(to: CustomError.self).eraseToAnyPublisher()
                    .map { Login.Action.signOutResult(.success($0)) }
                    .catch { Just(Login.Action.signOutResult(.failure($0))) }
                    .eraseToAnyPublisher()

            case
                    .signInResult(.failure),
                    .signOutResult,
                    .getInfoResult:
                return Empty().eraseToAnyPublisher()
            }
        }
    }
}