//
//  Handler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

// MARK: - ARCHITECTURE OK - Handler
typealias Handler<State, Action> = (Action, State) -> AnyPublisher<Action, Never>
protocol HandlerBase: ReduxBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never>
}
