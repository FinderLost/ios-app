//
//  AnyPublisher+failure.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Combine

extension AnyPublisher {
    public static func failure<Value, Error>(_ error: Error) -> AnyPublisher<Value, Error> {
        Fail(error: error)
            .eraseToAnyPublisher()
    }
}
