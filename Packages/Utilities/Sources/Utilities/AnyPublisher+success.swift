//
//  AnyPublisher+success.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Combine

extension AnyPublisher {
    public static func success<Value>(_ value: Value) -> AnyPublisher<Value, Error> {
        Just(value)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
