//
//  LoginTCA+HandlerTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import XCTest

import Factory

@testable import Module

final class LoginTCAHandlerTests: XCTestCase {
    func testHandleLoginTCAActionNotFound() {
        let action = ReduxActionMock()
        let result = HandlerDI.login().perform(
            on: self,
            for: action,
            with: LoginTCA.State.idle
        )

        XCTAssertNil(result)
    }

    func performHandle(on action: LoginTCA.Action) -> LoginTCA.Action? {
        HandlerDI.login().perform(on: self, for: action, with: LoginTCA.State.idle)
    }
}

// MARK: - Call getInfo
extension LoginTCAHandlerTests {
    func testHandleGetInfoSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingGetInfo, .success(UserInfoBuilderFake().entity))
        }
        let action = LoginTCA.Action.getInfo
        let result = performHandle(on: action)
        guard case let .setInfo(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetInfoFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingGetInfo, .failure())
        }
        let action = LoginTCA.Action.getInfo
        let result = performHandle(on: action)
        guard case let .setInfo(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - Call signIn
extension LoginTCAHandlerTests {
    func testHandleGetSignInSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignIn, .success(UserSessionBuilderFake().entity))
        }
        let action = LoginTCA.Action.getSignIn
        let result = performHandle(on: action)
        guard case let .setSignIn(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetSignInFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignIn, .failure())
        }
        let action = LoginTCA.Action.getSignIn
        let result = performHandle(on: action)
        guard case let .setSignIn(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - Call restorePreviousSignIn
extension LoginTCAHandlerTests {
    func testHandleGetUserSessionSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingRestorePreviousSignIn, .success(UserSessionBuilderFake().entity))
        }

        let action = LoginTCA.Action.getUserSession
        let result = performHandle(on: action)
        guard case let .setUserSession(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetUserSessionFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingRestorePreviousSignIn, .failure())
        }

        let action = LoginTCA.Action.getUserSession
        let result = performHandle(on: action)
        guard case let .setUserSession(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - Call signOut
extension LoginTCAHandlerTests {
    func testHandleGetSignOutSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignOut, .success(()))
        }

        let action = LoginTCA.Action.getSignOut
        let result = performHandle(on: action)
        guard case let .setSignOut(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetSignOutFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignOut, .failure())
        }

        let action = LoginTCA.Action.getSignOut
        let result = performHandle(on: action)
        guard case let .setSignOut(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - Trigger getInfo
extension LoginTCAHandlerTests {
    func testHandleSetSignInSuccess() {
        let action = LoginTCA.Action.setSignIn(.success(UserSessionBuilderFake().entity))
        let result = performHandle(on: action)
        guard case .getInfo = result else { XCTFail("Action not called"); return }
        XCTAssertTrue(true)
    }

    func testHandleSetUserSessionSuccess() {
        let action = LoginTCA.Action.setUserSession(.success(UserSessionBuilderFake().entity))
        let result = performHandle(on: action)
        guard case .getInfo = result else { XCTFail("Action not called"); return }
        XCTAssertTrue(true)
    }
}

// MARK: - Trigger getSignOut
extension LoginTCAHandlerTests {
    func testHandleSetUserSessionFailure() {
        let action = LoginTCA.Action.setUserSession(.failure(NSErrorBuilderFake().entity))
        let result = performHandle(on: action)
        guard case .getSignOut = result else { XCTFail("Action not called"); return }
        XCTAssertTrue(true)
    }
}

// MARK: - Return nil
extension LoginTCAHandlerTests {
    func testHandleSetSignInFailure() {
        let action = LoginTCA.Action.setSignIn(.failure(NSErrorBuilderFake().entity))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
    func testHandleSetSignOutSuccess() {
        let action = LoginTCA.Action.setSignOut(.success(()))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
    func testHandleSetSignOutFailure() {
        let action = LoginTCA.Action.setSignOut(.failure(NSErrorBuilderFake().entity))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
    func testHandleSetInfoSuccess() {
        let action = LoginTCA.Action.setInfo(.success(UserInfoBuilderFake().entity))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
    func testHandleSetInfoFailure() {
        let action = LoginTCA.Action.setInfo(.failure(NSErrorBuilderFake().entity))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
}
