//
//  Publisher+mapToVoid.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/2/23.
//

import Combine

extension Publisher {
    ///
    /// An extension to the Publisher protocol that provides a convenience method for mapping its output to Void.
    ///
    /// - Returns: A new publisher that outputs Void and passes through the original publisher's Failure type.
    public func mapToVoid() -> AnyPublisher<Void, Self.Failure> {
        map { _ in () }.eraseToAnyPublisher()
    }
}
