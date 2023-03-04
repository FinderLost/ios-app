//
//  AnyPublisher+failure.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Combine

extension AnyPublisher {
    ///
    /// Creates a publisher that immediately terminates with the specified error.
    ///
    ///- Parameter error: The error to send when the publisher terminates.
    ///- Returns: A publisher that immediately terminates with the specified error.
    public static func failure<Value, Error>(_ error: Error) -> AnyPublisher<Value, Error> {
        Fail(error: error).eraseToAnyPublisher()
    }
}
