//
//  MissingTCA+StateTests.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//  
//

import XCTest

@testable import Module

class MissingTCAStateTests: XCTestCase {
    let data = MissingTCA.DataBuilderFake().entity

    func testIdle() {
        let state = MissingTCA.State.idle
        XCTAssertTrue(state.hasData.isNil)
        XCTAssertTrue(state.hasError.isNil)
        XCTAssertFalse(state.isLoading)
    }

    func testHasData() {
        let state = MissingTCA.State.success(data)
        XCTAssertEqual(state.hasData, data)
    }

    func testHasError() {
        let state = MissingTCA.State.failed("Test Error")
        XCTAssertEqual(state.hasError, "Test Error")
    }

    func testIsLoading() {
        let state = MissingTCA.State.loading
        XCTAssertTrue(state.isLoading)
    }
}
