//
//  Handler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

typealias HandlerOf<_Reducer: Redux> = any Handler<_Reducer.Action, _Reducer.State>
protocol Handler<Action, State>: Redux {
    func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never>
}
