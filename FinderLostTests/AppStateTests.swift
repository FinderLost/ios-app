//
//  AppStateTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 16/12/22.
//

import XCTest
@testable import FinderLost

class AppStateTests: XCTestCase {
    func test_appReducer_updates_userName() {
        // Given
        let initialState = AppState(userName: "", userEmail: "")
        let action = AppAction.updateUserName("John")
        let expectedState = AppState(userName: "John", userEmail: "")

        // When
        let newState = appReducer(state: initialState, action: action)

        // Then
        XCTAssertEqual(newState, expectedState)
    }

    func test_appReducer_updates_userEmail() {
        // Given
        let initialState = AppState(userName: "", userEmail: "")
        let action = AppAction.updateUserEmail("john@example.com")
        let expectedState = AppState(userName: "", userEmail: "john@example.com")

        // When
        let newState = appReducer(state: initialState, action: action)

        // Then
        XCTAssertEqual(newState, expectedState)
    }
}
