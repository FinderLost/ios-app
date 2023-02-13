//
//  Publisher+mapToVoid.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import Combine

extension Publisher {
    public func mapToVoid() -> AnyPublisher<Void, Self.Failure> {
        map { _ in () }.eraseToAnyPublisher()
    }
}
