//
//  HandlerContext.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

protocol HandlerContext {
    associatedtype Action
    associatedtype State
    var action: Action { get }
    var state: State { get }
    func nextAction(_ action: ReduxAction) -> ReduxAction?
}

final class HandlerContextImpl<Action: ReduxAction, State>: HandlerContext {
    private let next: (Action) -> ReduxAction
    let action: Action
    let state: State

    init(
        action: Action,
        state: State,
        next: @escaping (Action) -> ReduxAction
    ) {
        self.action = action
        self.state = state
        self.next = next
    }

    func nextAction(_ nextAction: ReduxAction) -> ReduxAction? {
        guard let nextAction = nextAction as? Action else { return nil }
        return next(nextAction)
    }
}
