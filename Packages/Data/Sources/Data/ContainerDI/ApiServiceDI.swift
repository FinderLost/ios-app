//
//  ApiServiceDI.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 1/3/23.
//

import Factory

final class ApiServiceDI: SharedContainer {
    static let missing = Factory<MissingApiService>(scope: .singleton) {
        MissingFirebaseApiService()
    }
}
