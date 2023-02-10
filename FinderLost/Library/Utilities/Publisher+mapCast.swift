//
//  Publisher+mapCast.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

import Combine

extension Publisher {
    /// Transforms elements in the publisher to the specified type, excluding elements that cannot be cast to that type.
    ///
    /// - Parameter type: The type to cast elements to.
    /// - Returns: A new publisher of the specified type, excluding elements that could not be cast.
    func mapCast<T>(_ type: T.Type) -> AnyPublisher<T, Self.Failure> {
        compactMap {
            guard let newType = $0 as? T else {
                assertionDebug("Failed to cast element to specified type")
                return nil
            }
            return newType
        }
        .eraseToAnyPublisher()
    }
}
