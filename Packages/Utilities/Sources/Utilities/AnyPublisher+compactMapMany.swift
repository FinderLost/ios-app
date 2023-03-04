//
//  AnyPublisher+compactMapMany.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 3/3/23.
//

import Combine

extension AnyPublisher where Output: Collection {
    /// An extension to compact map elements of a collection into a new form that can be optionally nil.
    ///
    /// - parameter transform: A closure that takes an element of the collection as its argument and returns an optional value.
    /// - returns: A publisher that contains an array of the non-nil results of calling the transform
    public func compactMapMany<Result>(_ transform: @escaping (Output.Element) -> Result?) -> AnyPublisher<[Result], Failure> {
        map { collection -> [Result] in
            collection.compactMap(transform)
        }
        .eraseToAnyPublisher()
    }
}
