//
//  LoginReducerTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import XCTest

@testable import Module

class LoginReducerTests: XCTestCase {
    let signIn = Login.SignInBuilderFake().entity
    let userSession = UserSessionBuilderFake().entity
    let error = NSErrorBuilderFake().entity
    let userInfo = UserInfoBuilderFake().entity
    let initialState = Login.State.idle
}

// MARK: - Idle State
extension LoginReducerTests {
    func testReduceGetUserSession() {
        let action = Login.Action.getUserSession
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .idle)
    }
}

// MARK: - Loading State
extension LoginReducerTests {
    func testReduceSignInAction() {
        let action = Login.Action.signIn
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, Login.State.loading)
    }
    func testReduceSignOutAction() {
        let action = Login.Action.signOut
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .loading)
    }
    func testReduceGetInfoAction() {
        let action = Login.Action.getInfo
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, Login.State.loading)
    }
}

// MARK: - SignIn State
extension LoginReducerTests {
    func testGetInfoResultSuccessAction() {
        let action = Login.Action.getInfoResult(.success(userInfo))
        let signIn = Login.SignInBuilderFake()
            .set(\.name, userInfo.name)
            .set(\.email, userInfo.email)
            .set(\.imageUrl, userInfo.imageUrl)
            .entity

        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, Login.State.signIn(signIn))
    }
}

// MARK: - SignOut State
extension LoginReducerTests {
    func testSignOutResultSuccessAction() {
        let action = Login.Action.signOutResult(.success(()))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, Login.State.signOut)
    }
}

// MARK: - Error State
extension LoginReducerTests {
    func testReduceGetUserSessionResultFailureAction() {
        let action = Login.Action.getUserSessionResult(.failure(error))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testSignInResultFailureAction() {
        let action = Login.Action.signInResult(.failure(error))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testSignOutResultFailureAction() {
        let action = Login.Action.signOutResult(.failure(error))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
    func testGetInfoResultFailureAction() {
        let action = Login.Action.getInfoResult(.failure(error))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
}

// MARK: - Break State
extension LoginReducerTests {
    func testReduceGetUserSessionResultSuccessAction() {
        let action = Login.Action.getUserSessionResult(.success(userSession))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, .idle)
    }

    func testSignInResultSuccessAction() {
        let action = Login.Action.signInResult(.success(userSession))
        let newState = Login.reduce(action, with: initialState)
        XCTAssertEqual(newState, Login.State.idle)
    }
}
