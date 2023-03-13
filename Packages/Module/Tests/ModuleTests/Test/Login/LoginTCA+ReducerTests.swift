//
//  LoginTCA+ReducerTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import XCTest

@testable import Module

final class LoginTCAReducerTests: XCTestCase {
    let signIn = LoginTCA.DataBuilderFake().entity
    let userSession = UserSessionBuilderFake().entity
    let error = NSErrorBuilderFake().entity
    let userInfo = UserInfoBuilderFake().entity
    let initialState = LoginTCA.State.idle
}

// MARK: - idle
extension LoginTCAReducerTests {
    func testReduceGetUserSession() {
        let action = LoginTCA.Action.getUserSession
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .idle)
    }
}

// MARK: - loading
extension LoginTCAReducerTests {
    func testReduceGetSignIn() {
        let action = LoginTCA.Action.getSignIn
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.loading)
    }
    func testReduceGetSignOut() {
        let action = LoginTCA.Action.getSignOut
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .loading)
    }
    func testReduceGetInfo() {
        let action = LoginTCA.Action.getInfo
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.loading)
    }
}

// MARK: - signIn
extension LoginTCAReducerTests {
    func testReduceSetInfoSuccess() {
        let action = LoginTCA.Action.setInfo(.success(userInfo))
        let signIn = LoginTCA.DataBuilderFake()
            .set(\.name, userInfo.name)
            .set(\.email, userInfo.email)
            .set(\.imageUrl, userInfo.imageUrl)
            .entity

        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.signIn(signIn))
    }
}

// MARK: - signOut
extension LoginTCAReducerTests {
    func testReduceSetSignOutSuccess() {
        let action = LoginTCA.Action.setSignOut(.success(()))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.signOut)
    }
}

// MARK: - failed
extension LoginTCAReducerTests {
    func testReduceSetUserSessionFailure() {
        let action = LoginTCA.Action.setUserSession(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testReduceSetSignInFailure() {
        let action = LoginTCA.Action.setSignIn(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testReduceSetSignOutFailure() {
        let action = LoginTCA.Action.setSignOut(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testReduceSetInfoFailure() {
        let action = LoginTCA.Action.setInfo(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
}

// MARK: - break
extension LoginTCAReducerTests {
    func testReduceSetUserSessionSuccess() {
        let action = LoginTCA.Action.setUserSession(.success(userSession))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .idle)
    }

    func testReduceSetSignInSuccess() {
        let action = LoginTCA.Action.setSignIn(.success(userSession))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.idle)
    }
}
