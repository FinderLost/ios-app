//
//  Handler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

public typealias HandlerOf<_Reducer: Redux> = any Handler<_Reducer.Action, _Reducer.State>
public protocol Handler<Action, State>: Redux {
    func handle(_ context: some HandlerContext) -> AnyPublisher<ReduxAction, Never>?
}
