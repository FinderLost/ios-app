//
//  Missing.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux
import Domain

import Combine
import Factory

extension Missing {
    public class HandlerImpl<Action: ReduxAction, State: ReduxState>: Handler {
//        private let exampleRepository: ExampleRepository
//
//        public init(exampleRepository: ExampleRepository) {
//            self.exampleRepository = exampleRepository
//        }
        public init() { }

        public func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never> {
            guard let action = context.action as? Missing.Action
            else { return Empty().eraseToAnyPublisher() }

            switch action {

            case .getAction:
//                return exampleRepository.getData()
                return Just(()).setFailureType(to: CustomError.self).eraseToAnyPublisher()
                    .map { Missing.Action.setAction(.success($0)) }
                    .catch { Just(Missing.Action.setAction(.failure($0))) }
                    .eraseToAnyPublisher()

            case .setAction:
                return Empty().eraseToAnyPublisher()
            }
        }
    }
}
