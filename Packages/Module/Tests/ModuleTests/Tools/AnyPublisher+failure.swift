//
//  AnyPublisher+failure.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Combine

extension AnyPublisher {
    static func failure<Value>() -> AnyPublisher<Value, Error> {
        .failure(NSErrorBuilderFake().entity)
    }
}
