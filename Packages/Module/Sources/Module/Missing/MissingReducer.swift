//
//  Missing.swift
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
        case .getMissingList:
            newState = .loading

        case let .setMissingList(.success(value)):
            newState = .success(MissingTCA.Data(missingList: value))

        case let .setMissingList(.failure(error)):
            newState = .failed(error.localizedDescription)
        }

        return newState
    }
}

private extension MissingTCA.Data {
    init(missingList: [Missing]) {
        self.init(
            publicList: missingList.map(MissingTCA.DataItem.init)
        )
    }
}

private extension MissingTCA.DataItem {
    init(missing: Missing) {
        self.init(
            name: missing.name,
            description: missing.description
        )
    }
}
