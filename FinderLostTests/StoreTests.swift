//
//  StoreTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import XCTest
@testable import FinderLost

class StoreTests: XCTestCase {
    func test_dispatch_updates_state() {
        // Given
        let initialState = AppState(userName: "", userEmail: "")
        let store = Store(initialState: initialState, reducer: appReducer)
        let action = AppAction.updateUserName("John")
        let expectedState = AppState(userName: "John", userEmail: "")

        // When
        store.dispatch(action)

        // Then
        XCTAssertEqual(store.state, expectedState)
    }
}
