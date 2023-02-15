//
//  LoginHandlerTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import XCTest

import Factory

import Combine

import Redux
@testable import FinderLost

class LoginHandlerImplTests: XCTestCase {
    var handler: HandlerOf<Login>!

    let userSession = UserSessionBuilderFake().entity
    let initialState = Login.State.idle
    let error = NSErrorBuilderFake().entity
    var cancellables: [AnyCancellable] = []

    override func setUp() {
        super.setUp()
        Container.Registrations.push()
    }

    override func tearDown() {
        super.tearDown()
        Container.Registrations.pop()
    }

}

// MARK: - SignIn
extension LoginHandlerImplTests {
    func testHandleSignInActionSuccess1() {
        let userRepositoryMock = UserRepositoryMock()
            .set(\.underlyingSignIn, Just(userSession).setFailureType(to: Error.self).eraseToAnyPublisher())
        Container.userRepository.register { userRepositoryMock }
        handler = Login.HandlerImpl()
        let action = Login.Action.signIn
        let context = HandlerContextImpl(action: action, state: initialState) { _ in action }

        let expectation = XCTestExpectation(description: "signInResult callback should be called")

        handler.handle(context)
            .mapCast(Login.Action.self)
            .sink { result in
                guard case let .signInResult(value) = result else { XCTFail("Action not called"); return }
                XCTAssertNotNil(value.success)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
    func testHandleSignInActionSuccess() {
        let userRepositoryMock = UserRepositoryMock()
            .set(\.underlyingSignIn, Just(userSession).setFailureType(to: Error.self).eraseToAnyPublisher())
        Container.userRepository.register { userRepositoryMock }
        handler = Login.HandlerImpl()
        let action = Login.Action.signIn
        let context = HandlerContextImpl(action: action, state: initialState) { _ in action }
        let result = try? handler.handle(context)
            .mapCast(Login.Action.self)
            .awaitPublisher(on: self)

        guard case let .signInResult(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }
    func testHandleSignInActionFailure() {
        let userRepositoryMock = UserRepositoryMock()
            .set(\.underlyingSignIn, Fail(error: error).eraseToAnyPublisher())
        Container.userRepository.register { userRepositoryMock }
        handler = Login.HandlerImpl()
        let action = Login.Action.signIn
        let context = HandlerContextImpl(action: action, state: initialState) { _ in action }
        let result = try? handler.handle(context)
            .mapCast(Login.Action.self)
            .awaitPublisher(on: self)

        guard case let .signInResult(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}
