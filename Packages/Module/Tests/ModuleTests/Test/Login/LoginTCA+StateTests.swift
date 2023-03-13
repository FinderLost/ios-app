//
//  LoginTCA+StateTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import XCTest

@testable import Module

class LoginTCAStateTests: XCTestCase {
    let data = LoginTCA.DataBuilderFake().entity

    func testIdle() {
        let state = LoginTCA.State.idle
        XCTAssertFalse(state.isLoading)
        XCTAssertFalse(state.isSignIn)
        XCTAssertFalse(state.isSignOut)
        XCTAssertTrue(state.hasData.isNil)
        XCTAssertTrue(state.hasError.isNil)
    }

    func testIsSignIn() {
        let state = LoginTCA.State.signIn(data)
        XCTAssertTrue(state.isSignIn)
    }

    func testIsSignOut() {
        let state = LoginTCA.State.signOut
        XCTAssertTrue(state.isSignOut)
    }

    func testHasData() {
        let state = LoginTCA.State.signIn(data)
        XCTAssertEqual(state.hasData, data)
    }

    func testHasError() {
        let state = LoginTCA.State.failed("Test Error")
        XCTAssertEqual(state.hasError, "Test Error")
    }

    func testIsLoading() {
        let state = LoginTCA.State.loading
        XCTAssertTrue(state.isLoading)
    }
}
