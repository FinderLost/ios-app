//
//  Publisher+awaitPublisher.swift
//  FinderLostTests
//
//  Created by Andres Felipe Alzate Restrepo on 15/2/23.
//

import XCTest

import Combine

extension Publisher {
    func awaitPublisher(
        on environment: XCTestCase,
        timeout: TimeInterval = 10,
        file: StaticString = #file,
        line: UInt = #line
    ) throws -> Output {
        // This time, we use Swift's Result type to keep track
        // of the result of our Combine pipeline:
        var result: Result<Output, Error>?
        let expectation = environment.expectation(description: "Awaiting publisher")

        let cancellable = sink(
            receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    result = .failure(error)
                case .finished:
                    break
                }

                expectation.fulfill()
            },
            receiveValue: { value in
                result = .success(value)
            }
        )

        environment.waitForExpectations(timeout: timeout)
        cancellable.cancel()

        let unwrappedResult = try XCTUnwrap(
            result,
            "Awaited publisher did not produce any output",
            file: file,
            line: line
        )

        return try unwrappedResult.get()
    }
}
