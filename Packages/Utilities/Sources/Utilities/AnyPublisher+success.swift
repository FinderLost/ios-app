//
//  AnyPublisher+success.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Combine

extension AnyPublisher {
    ///
    /// Returns a publisher that immediately emits a single value and then finishes successfully.
    ///
    /// - Parameter value: The value to emit.
    /// - Returns: A publisher that immediately emits a single value and then finishes successfully.
    ///
    public static func success<Value>(_ value: Value) -> AnyPublisher<Value, Error> {
        Just(value)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
