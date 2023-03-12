//
//  Publisher+mapCastTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

import XCTest

import Combine

@testable import Utilities

private protocol TypeToTest { }
final class PublisherMapCastTest: XCTestCase {
    struct TypeA: TypeToTest {}
    struct TypeB: TypeToTest {}
    struct TypeC {}
    var typeToTest: [Any] = [TypeA(), TypeB(), TypeA()]
    private var cancellables = Set<AnyCancellable>()

    func testMapCastMatchingAllElements() {
        var receivedElements = [TypeToTest]()

        typeToTest.publisher
            .mapCast(TypeToTest.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(receivedElements.count, self.typeToTest.count)
                case let .failure(error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { receivedElements.append($0) })
            .store(in: &cancellables)
    }

    func testMapCastNoMatchingAllElements() {
        var receivedElements = [TypeToTest]()
        typeToTest.append(TypeC())

        expectAssertionFailure(expectedMessage: "Failed to cast element to specified type") { [weak self] in
            guard let self else { return }
            self.typeToTest.publisher
                .mapCast(TypeToTest.self)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        XCTAssertEqual(receivedElements.count, self.typeToTest.count - 1)
                    case let .failure(error):
                        XCTFail("Unexpected error: \(error)")
                    }
                }, receiveValue: { receivedElements.append($0) })
                .store(in: &self.cancellables)
        }
    }
}
