//
//  LoginTCAHandlerTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import XCTest

import Factory

import Combine

import Redux
@testable import Module

class LoginHandlerImplTests: XCTestCase { }

// MARK: - SignIn
extension LoginHandlerImplTests {
    func testHandleSignInActionSuccess() {
        let userRepositoryMock = UserRepositoryMock()
            .set(\.underlyingSignIn, .success(UserSessionBuilderFake().entity))

        RepositoryDI.user.register { userRepositoryMock }

        let action = LoginTCA.Action.getSignIn
        let context = HandlerContextImpl(action: action, state: LoginTCA.State.idle) { _ in action }
        let result = try? HandlerDI.login().handle(context)?
            .mapCast(LoginTCA.Action.self)
            .awaitPublisher(on: self)

        guard case let .setSignIn(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleSignInActionFailure() {
        let userRepositoryMock = UserRepositoryMock()
            .set(\.underlyingSignIn, .failure())
        RepositoryDI.user.register { userRepositoryMock }

        let action = LoginTCA.Action.getSignIn
        let context = HandlerContextImpl(action: action, state: LoginTCA.State.idle) { _ in action }
        let result = try? HandlerDI.login().handle(context)?
            .mapCast(LoginTCA.Action.self)
            .awaitPublisher(on: self)

        guard case let .setSignIn(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}
