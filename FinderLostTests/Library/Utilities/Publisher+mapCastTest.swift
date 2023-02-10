//
//  Publisher+mapCastTest.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

import XCTest
import Combine

@testable import FinderLost

private protocol TypeToTest { }
final class PublisherMapCastTest: XCTestCase {
    struct TypeA: TypeToTest {}
    struct TypeB: TypeToTest {}
    struct TypeC {}
    func testMapCastFiltersOutNonMatchingElements() {
        let typeToTest: [Any] = [TypeA(), TypeB(), TypeA(), TypeB()]
        let castedPublisher = typeToTest.publisher
            .mapCast(TypeToTest.self)

        let expectation = XCTestExpectation(description: "Only matching elements should be received")
        var receivedElements = [TypeToTest]()

        castedPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTAssertEqual(receivedElements.count, typeToTest.count)
                    expectation.fulfill()
                case let .failure(error):
                    XCTFail("Unexpected error: \(error)")
                }
            }, receiveValue: { receivedElements.append($0) })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 0.1)
    }

    private var cancellables = Set<AnyCancellable>()
}
