//
//  HandlerContext.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

import Utilities

public protocol HandlerContext {
    associatedtype Action
    associatedtype State
    var action: Action { get }
    var state: State { get }
    func nextAction(_ action: ReduxAction) -> ReduxAction?
}

public final class HandlerContextImpl<Action: ReduxAction, State>: HandlerContext {
    private let next: (Action) -> ReduxAction
    public let action: Action
    public let state: State

    public init(
        action: Action,
        state: State,
        next: @escaping (Action) -> ReduxAction
    ) {
        self.action = action
        self.state = state
        self.next = next
    }

    public func nextAction(_ nextAction: ReduxAction) -> ReduxAction? {
        guard let nextAction = nextAction as? Action else {
            triggerAssertionFailure("Fails to unwrap the next action")
            return nil
        }
        return next(nextAction)
    }
}
