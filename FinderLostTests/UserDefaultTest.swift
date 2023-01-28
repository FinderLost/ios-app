//
//  UserDefaultTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import XCTest

import Foundation
@testable import FinderLost

class UserDefaultTests: XCTestCase {
    private var sut: UserDefault<String>!
    private let testKey = "test_key"
    private let testValue = "test_value"
    private let testDefaultValue = "default_value"

    override func setUp() {
        super.setUp()
        UserDefaults.standard.removeObject(forKey: testKey)
        sut = .init(testKey, defaultValue: testDefaultValue)
    }

    func test_dispatch_updates_state_whenNoValueIsSet() {
        XCTAssertEqual(sut.wrappedValue, testDefaultValue)
    }

    func test_dispatch_updates_state_setsAndGetsValueCorrectly() {
        sut.wrappedValue = testValue
        XCTAssertEqual(sut.wrappedValue, testValue)
    }
}
