//
//  Handler+perform.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 12/3/23.
//

import Redux

import XCTest

extension Handler {
    func perform<Action: ReduxAction>(
        on environment: XCTestCase,
        for action: Action,
        with state: any ReduxState
    ) -> Action? {
        let context = HandlerContextImpl(action: action, state: state) { _ in action }
        return try? handle(context)?
            .mapCast(Action.self)
            .awaitPublisher(on: environment)
    }
}
