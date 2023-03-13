//
//  MissingTCA+Handler.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux
import Domain

import Combine
import Factory

extension MissingTCA {
    public class HandlerImpl<Action: ReduxAction, State: ReduxState>: Handler {
        private let missingRepository: MissingRepository

        public init(missingRepository: MissingRepository) {
            self.missingRepository = missingRepository
        }

        public func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never>? {
            guard let action = context.action as? MissingTCA.Action else { return nil }

            switch action {

            case .getMissingList:
                return missingRepository.getMissingList()
                    .map { MissingTCA.Action.setMissingList(.success($0)) }
                    .catch { Just(MissingTCA.Action.setMissingList(.failure($0))) }
                    .eraseToAnyPublisher()

            case .setMissingList:
                return nil
            }
        }
    }
}
