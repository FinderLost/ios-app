//
//  MissingRepository.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 1/3/23.
//

import Combine

public protocol MissingRepository {
    func getMissingList() -> AnyPublisher<[Missing], Error>
}
