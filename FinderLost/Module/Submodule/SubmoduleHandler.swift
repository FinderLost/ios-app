//
//  SubmoduleHandler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Foundation

// MARK: - Submodule Handler
extension Submodule: HandlerBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never> {
        Future { promise in
            switch action {
            case let .checkAsync(token):
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    promise(.success(.checkSubmodule("Submodule: \(token)")))
                }
            default: break
            }
        }.eraseToAnyPublisher()
    }
}
