//
//  MissingTCA+ReducerTests
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//  
//

import XCTest

@testable import Module

class MissingTCAReducerTests: XCTestCase {
    let data = MissingBuilderFake().entity
    let error = NSErrorBuilderFake().entity
    let initialState = MissingTCA.State.idle
}

// MARK: - loading
extension MissingTCAReducerTests {
    func testReduceGetAction() {
        let action = MissingTCA.Action.getMissingList
        let newState = MissingTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, MissingTCA.State.loading)
    }
}

// MARK: - success
extension MissingTCAReducerTests {
    func testReduceSetMissingListSuccess() {
        let action = MissingTCA.Action.setMissingList(.success([data]))
        let newState = MissingTCA.reduce(action, with: initialState)
        guard case let .success(data) = newState else { XCTFail("Action not called"); return }
        XCTAssertNotEqual(data.publicList.count, .zero)
    }
}

// MARK: - failed
extension MissingTCAReducerTests {
    func testReduceSetMissingListFailure() {
        let action = MissingTCA.Action.setMissingList(.failure(error))
        let newState = MissingTCA.reduce(action, with: initialState)
        XCTAssertEqual(newState, .failed(error.localizedDescription))
    }
}
