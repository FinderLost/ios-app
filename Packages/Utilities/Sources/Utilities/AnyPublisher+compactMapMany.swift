//
//  AnyPublisher+compactMapMany.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 3/3/23.
//

import Combine

extension AnyPublisher where Output: Collection {
    /**
     Projects each element of an observable collection into a new form.

     - parameter transform: A transform function to apply to each element of the source collection.
     - returns: An observable collection whose elements are the result of invoking the transform function on each element of source.
     */
    public func compactMapMany<Result>(_ transform: @escaping (Output.Element) -> Result?) -> AnyPublisher<[Result], Failure> {
        map { collection -> [Result] in
            collection.compactMap(transform)
        }
        .eraseToAnyPublisher()
    }
}
