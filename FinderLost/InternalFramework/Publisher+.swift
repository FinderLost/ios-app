//
//  Publisher+.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

import Combine

extension Publisher {
    func mapCast<T>(_ type: T.Type) -> AnyPublisher<T, Self.Failure> {
        compactMap { $0 as? T }.eraseToAnyPublisher()
    }
}
