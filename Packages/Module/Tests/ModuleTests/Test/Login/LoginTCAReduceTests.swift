//
//  LoginTCAReduceTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import XCTest

@testable import Module

class LoginTCAReduceTests: XCTestCase {
    let signIn = LoginTCA.DataBuilderFake().entity
    let userSession = UserSessionBuilderFake().entity
    let error = NSErrorBuilderFake().entity
    let userInfo = UserInfoBuilderFake().entity
    let initialState = LoginTCA.State.idle
}

// MARK: - Idle State
extension LoginTCAReduceTests {
    func testReduceGetUserSession() {
        let action = LoginTCA.Action.getUserSession
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .idle)
    }
}

// MARK: - Loading State
extension LoginTCAReduceTests {
    func testReduceSignInAction() {
        let action = LoginTCA.Action.getSignIn
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.loading)
    }
    func testReduceSignOutAction() {
        let action = LoginTCA.Action.getSignOut
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .loading)
    }
    func testReduceGetInfoAction() {
        let action = LoginTCA.Action.getInfo
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.loading)
    }
}

// MARK: - SignIn State
extension LoginTCAReduceTests {
    func testGetInfoResultSuccessAction() {
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

// MARK: - SignOut State
extension LoginTCAReduceTests {
    func testSignOutResultSuccessAction() {
        let action = LoginTCA.Action.setSignOut(.success(()))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.signOut)
    }
}

// MARK: - Error State
extension LoginTCAReduceTests {
    func testReduceGetUserSessionResultFailureAction() {
        let action = LoginTCA.Action.setUserSession(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testSignInResultFailureAction() {
        let action = LoginTCA.Action.setSignIn(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testSignOutResultFailureAction() {
        let action = LoginTCA.Action.setSignOut(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testGetInfoResultFailureAction() {
        let action = LoginTCA.Action.setInfo(.failure(error))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
}

// MARK: - Break State
extension LoginTCAReduceTests {
    func testReduceGetUserSessionResultSuccessAction() {
        let action = LoginTCA.Action.setUserSession(.success(userSession))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .idle)
    }

    func testSignInResultSuccessAction() {
        let action = LoginTCA.Action.setSignIn(.success(userSession))
        let newState = LoginTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, LoginTCA.State.idle)
    }
}
