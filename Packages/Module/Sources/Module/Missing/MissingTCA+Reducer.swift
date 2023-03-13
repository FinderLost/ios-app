//
//  MissingTCA+Reducer.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Domain

import Redux

extension MissingTCA: Reducer {
    public static func reduce(_ action: Action, with state: State) -> State {
        var newState = state

        switch action {
            // MARK: - idle
            // MARK: - loading
        case .getMissingList:
            newState = .loading

            // MARK: - success
        case let .setMissingList(.success(value)):
            newState = .success(MissingTCA.Data(missingList: value))

            // MARK: - failed
        case let .setMissingList(.failure(error)):
            newState = .failed(error.localizedDescription)

            // MARK: - break
        }

        return newState
    }
}
