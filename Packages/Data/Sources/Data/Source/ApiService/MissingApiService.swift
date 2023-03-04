//
//  MissingApiService.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 1/3/23.
//

import Combine

protocol MissingApiService {
    func getMissingList() -> AnyPublisher<[MissingResponse], Error>
}
