//
//  AnyPublisher+decodeMany.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import Combine

import FirebaseFirestore

extension AnyPublisher where Output: Collection<QueryDocumentSnapshot> {
    /// An extension for decoding the Output of an AnyPublisher with QueryDocumentSnapshot elements into an array of Decodable objects.
    ///
    /// - parameter Result: A Decodable type.
    /// - returns: An AnyPublisher that publishes an array of Result objects or fails with a Failure.
    func decodeMany<Result: Decodable>() -> AnyPublisher<[Result], Failure> {
        compactMap { $0.decode() }
            .eraseToAnyPublisher()
    }
}
