//
//  ModuleMock.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/3/23.
//

import Redux
import Combine
import Foundation

// MARK: - State and Action
enum ModuleMock {
    enum State: ReduxState {
        case failure(String)
        case success(UUID)
        case loading
        case idle
    }
    enum Action: ReduxAction {
        case setUUID(Result<UUID, Error>)
        case getUUID
    }
}

// MARK: - reduce
extension ModuleMock: Reducer {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .setUUID(.success(uuid)): newState = .success(uuid)
        case let .setUUID(.failure(error)): newState = .failure(error.localizedDescription)
        case .getUUID: newState = .loading
        }
        return newState
    }
}

// MARK: - handle
extension ModuleMock {
    public class HandlerImpl<Action: ReduxAction, State: ReduxState>: Handler {
        public func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never>? {
            guard let action = context.action as? ModuleMock.Action else { return nil }
            switch action {
            case .getUUID:
                return Just(UUID())
                    .map { ModuleMock.Action.setUUID(.success($0)) }
                    .eraseToAnyPublisher()
            case .setUUID: return nil
            }
        }
    }
}
