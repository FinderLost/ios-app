//
//  XCTestCase+expectAssertionFailure.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/3/23.
//

import Utilities

import XCTest

extension XCTestCase {
    /// Helper function that tests whether a given closure triggers an assertion failure with the expected message.
    ///
    /// - Parameters:
    ///   - expectedMessage: The expected message of the assertion failure.
    ///   - testcase: The closure to test.
    public func expectAssertionFailure(
        expectedMessage: String,
        testcase: @escaping () -> Void
    ) {
        let expectation = self.expectation(description: "expecting assertionFailure")
        var assertionMessage: String = ""

        triggerAssertionFailure = { (message, _, _) in
            assertionMessage = message()
            DispatchQueue.main.async {
                expectation.fulfill()
            }

            Thread.exit()
            Swift.assertionFailure("Will never be executed since thread exits")
        }

        Thread(block: testcase).start()

        waitForExpectations(timeout: 0.1) { _ in
            XCTAssertEqual(expectedMessage, assertionMessage)
            triggerAssertionFailure = Swift.assertionFailure
        }
    }
}
