//
//  MissingRepositoryImpl.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 1/3/23.
//

import Domain

import Combine
import Factory

public final class MissingRepositoryImpl: MissingRepository {
    @Injected(ApiServiceDI.missing)
    private var missingApiService: MissingApiService

    public init() { }

    public func getMissingList() -> AnyPublisher<[Missing], Error> {
        missingApiService.getMissingList().compactMapMany(MissingImpl.init)
    }
}
