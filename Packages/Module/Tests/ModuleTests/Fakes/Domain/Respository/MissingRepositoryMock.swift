//
//  MissingRepositoryMock.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//

import Domain
import Utilities

import Combine

final class MissingRepositoryMock: MissingRepository, Modifiable {
    var missingList: [Missing] = [MissingBuilderFake().entity]

    var underlyingGetMissingList: AnyPublisher<[Missing], Error>!
    func getMissingList() -> AnyPublisher<[Missing], Error> {
        underlyingGetMissingList
    }
}
