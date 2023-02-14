//
//  LoginStateTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import XCTest

@testable import FinderLost

class LoginStateTest: XCTestCase {
    let signIn = Login.SignInBuilderFake().entity

    func testIdle() {
        let state = Login.State.idle
        XCTAssertFalse(state.isLoading)
        XCTAssertFalse(state.isSignIn)
        XCTAssertFalse(state.isSignOut)
        XCTAssertTrue(state.lastSignIn.isNil)
        XCTAssertTrue(state.error.isNil)
    }

    func testIsLoading() {
        let state = Login.State.loading
        XCTAssertTrue(state.isLoading)
    }

    func testIsSignIn() {
        let state = Login.State.signIn(signIn)
        XCTAssertTrue(state.isSignIn)
    }

    func testIsSignOut() {
        let state = Login.State.signOut
        XCTAssertTrue(state.isSignOut)
    }

    func testLastSignIn() {
        let state = Login.State.signIn(signIn)
        XCTAssertEqual(state.lastSignIn, signIn)
    }

    func testError() {
        let state = Login.State.error("Test Error")
        XCTAssertEqual(state.error, "Test Error")
    }
}
