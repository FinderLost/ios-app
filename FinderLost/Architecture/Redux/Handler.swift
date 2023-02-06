//
//  Handler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

protocol Handler<Action, State>: Redux {
    func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never>
}
