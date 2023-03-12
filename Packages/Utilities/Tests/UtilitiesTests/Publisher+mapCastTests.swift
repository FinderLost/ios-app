//
//  Publisher+mapCastTests.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

import XCTest

import Combine

@testable import Utilities

private protocol TypeToTest { }
private struct TypeA: TypeToTest {}
private struct TypeB: TypeToTest {}
private struct TypeC {}

final class PublisherMapCastTests: XCTestCase {
    func testMapCastMatchingAllElements() {
        let typeToTest: [Any] = [TypeA(), TypeB(), TypeA()]
        var cancellables = Set<AnyCancellable>()
        var receivedElements = [TypeToTest]()

        typeToTest.publisher
            .mapCast(TypeToTest.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(receivedElements.count, typeToTest.count)
                case let .failure(error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { receivedElements.append($0) })
            .store(in: &cancellables)
    }

    func testMapCastNoMatchingAllElements() {
        var typeToTest: [Any] = [TypeA(), TypeB(), TypeA()]
        var cancellables = Set<AnyCancellable>()
        var receivedElements = [TypeToTest]()

        typeToTest.append(TypeC())

        expectAssertionFailure(expectedMessage: "Failed to cast element to specified type") {
            typeToTest.publisher
                .mapCast(TypeToTest.self)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        XCTAssertEqual(receivedElements.count, typeToTest.count - 1)
                    case let .failure(error):
                        XCTFail("Unexpected error: \(error)")
                    }
                }, receiveValue: { receivedElements.append($0) })
                .store(in: &cancellables)
        }
    }
}
