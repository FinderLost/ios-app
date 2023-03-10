//
//  HandlerContextImplTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

import XCTest

@testable import Redux

final class HandlerContextImplTests: XCTestCase {
    struct ExampleAction: ReduxAction, Equatable {
        let value: Int
    }

    struct ExampleState: Equatable {
        let value: Int
    }

    func testNextAction() {
        let action = ExampleAction(value: 0)
        let state = ExampleState(value: 0)
        let next: (ExampleAction) -> ReduxAction = { $0 }

        let context = HandlerContextImpl(
            action: action,
            state: state,
            next: next
        )

        let nextAction = ExampleAction(value: 1)
        let result = context.nextAction(nextAction) as? ExampleAction

        XCTAssertEqual(result?.value, nextAction.value)
    }

    func testNextActionUnwrapFail() {
        struct ExampleActionFail: ReduxAction, Equatable { }
        let action = ExampleAction(value: 0)
        let state = ExampleState(value: 0)
        let next: (ExampleAction) -> ReduxAction = { $0 }

        let context = HandlerContextImpl(
            action: action,
            state: state,
            next: next
        )

        expectAssertionFailure(expectedMessage: "Fails to unwrap the next action") {
            let nextAction = ExampleActionFail()
            let result = context.nextAction(nextAction)
            XCTAssertNil(result, "The next action should return nil if it fails to unwrap")
        }
    }
}
