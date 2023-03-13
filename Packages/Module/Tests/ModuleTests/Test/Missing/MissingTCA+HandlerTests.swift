//
//  MissingTCA+HandlerTests
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//  
//

import XCTest

import Factory

@testable import Module

final class MissingTCAHandlerTests: XCTestCase {
    func testHandleMissingTCAActionNotFound() {
        let action = ReduxActionMock()
        let result = HandlerDI.missing().perform(
            on: self,
            for: action,
            with: MissingTCA.State.idle
        )

        XCTAssertNil(result)
    }

    func performHandle(on action: MissingTCA.Action) -> MissingTCA.Action? {
        HandlerDI.missing().perform(on: self, for: action, with: MissingTCA.State.idle)
    }
}

// MARK: - Call getData
extension MissingTCAHandlerTests {
    func testHandleGeActionSuccess() {
        RepositoryDI.missing.register {
            MissingRepositoryMock().set(\.underlyingGetMissingList, .success([]))
        }
        let action = MissingTCA.Action.getMissingList
        let result = performHandle(on: action)
        guard case let .setMissingList(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.success)
    }

    func testHandleGetActionFailure() {
        RepositoryDI.missing.register {
            MissingRepositoryMock().set(\.underlyingGetMissingList, .failure())
        }
        let action = MissingTCA.Action.getMissingList
        let result = performHandle(on: action)
        guard case let .setMissingList(value) = result else { XCTFail("Action not called"); return }
        XCTAssertNotNil(value.failure)
    }
}

// MARK: - Return nil
extension MissingTCAHandlerTests {
    func testHandleSetActionSuccess() {
        let action = MissingTCA.Action.setMissingList(.success([]))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
    func testHandleSetActionFailure() {
        let action = MissingTCA.Action.setMissingList(.failure(NSErrorBuilderFake().entity))
        let result = performHandle(on: action)
        XCTAssertNil(result)
    }
}
