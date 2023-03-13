//
//  LoginTCA+HandlerTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import XCTest

import Factory

import Combine

import Redux
@testable import Module

class LoginTCAHandlerTests: XCTestCase {
    func testHandleLoginActionNotFound() {
        let result = HandlerDI.login().perform(
            on: self,
            for: ReduxActionMock(),
            with: LoginTCA.State.idle
        )

        XCTAssertNil(result)
    }

    func performHandle(on action: LoginTCA.Action) -> LoginTCA.Action? {
        HandlerDI.login().perform(on: self, for: action, with: LoginTCA.State.idle)
    }
}

// MARK: - Info
extension LoginTCAHandlerTests {
    func testHandleGetInfoActionSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingGetInfo, .success(UserInfoBuilderFake().entity))
        }

        let result = performHandle(on: LoginTCA.Action.getInfo)
        guard case let .setInfo(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetInfoActionFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingGetInfo, .failure())
        }
        let result = performHandle(on: LoginTCA.Action.getInfo)
        guard case let .setInfo(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - SignIn
extension LoginTCAHandlerTests {
    func testHandleGetSignInActionSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignIn, .success(UserSessionBuilderFake().entity))
        }
        let result = performHandle(on: LoginTCA.Action.getSignIn)
        guard case let .setSignIn(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetSignInActionFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignIn, .failure())
        }
        let result = performHandle(on: LoginTCA.Action.getSignIn)
        guard case let .setSignIn(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - UserSession
extension LoginTCAHandlerTests {
    func testHandleGetUserSessionActionSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingRestorePreviousSignIn, .success(UserSessionBuilderFake().entity))
        }
        let result = performHandle(on: LoginTCA.Action.getUserSession)
        guard case let .setUserSession(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetUserSessionActionFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingRestorePreviousSignIn, .failure())
        }
        let result = performHandle(on: LoginTCA.Action.getUserSession)
        guard case let .setUserSession(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - SignOut
extension LoginTCAHandlerTests {
    func testHandleGetSignOutActionSuccess() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignOut, .success(()))
        }
        let result = performHandle(on: LoginTCA.Action.getSignOut)
        guard case let .setSignOut(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetSignOutActionFailure() {
        RepositoryDI.user.register {
            UserRepositoryMock().set(\.underlyingSignOut, .failure())
        }
        let result = performHandle(on: LoginTCA.Action.getSignOut)
        guard case let .setSignOut(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - Trigger getInfo
extension LoginTCAHandlerTests {
    func testHandleSetSignInSuccessAction() {
        let result = performHandle(on: LoginTCA.Action.setSignIn(.success(UserSessionBuilderFake().entity)))
        guard case .getInfo = result else { XCTFail("Action not called"); return }
        XCTAssertTrue(true)
    }

    func testHandleSetUserSessionSuccessAction() {
        let result = performHandle(on: LoginTCA.Action.setUserSession(.success(UserSessionBuilderFake().entity)))
        guard case .getInfo = result else { XCTFail("Action not called"); return }
        XCTAssertTrue(true)
    }
}

// MARK: - Trigger getSignOut
extension LoginTCAHandlerTests {
    func testHandleSetUserSessionFailureAction() {
        let result = performHandle(on: LoginTCA.Action.setUserSession(.failure(NSErrorBuilderFake().entity)))
        guard case .getSignOut = result else { XCTFail("Action not called"); return }
        XCTAssertTrue(true)
    }
}

// MARK: - Return nil
extension LoginTCAHandlerTests {
    func testHandleSetSignInFailureAction() {
        let result = performHandle(on: LoginTCA.Action.setSignIn(.failure(NSErrorBuilderFake().entity)))
        XCTAssertNil(result)
    }
    func testHandleSetSignOutSuccessAction() {
        let result = performHandle(on: LoginTCA.Action.setSignOut(.success(())))
        XCTAssertNil(result)
    }
    func testHandleSetSignOutFailureAction() {
        let result = performHandle(on: LoginTCA.Action.setSignOut(.failure(NSErrorBuilderFake().entity)))
        XCTAssertNil(result)
    }
    func testHandleSetInfoSuccessAction() {
        let result = performHandle(on: LoginTCA.Action.setInfo(.success(UserInfoBuilderFake().entity)))
        XCTAssertNil(result)
    }
    func testHandleSetInfoFailureAction() {
        let result = performHandle(on: LoginTCA.Action.setInfo(.failure(NSErrorBuilderFake().entity)))
        XCTAssertNil(result)
    }
}
