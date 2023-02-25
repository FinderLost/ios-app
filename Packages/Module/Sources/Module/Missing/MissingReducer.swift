//
//  Missing.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux

extension Missing: Reducer {
    public static func reduce(_ action: Action, with state: State) -> State {
        var newState = state

        switch action {
        case .getAction:
            newState = .loading

        case
            let .setAction(.success(value)):
            let data = Missing.Data(
                privateList: ["variableA"],
                publicList: ["variableB"]
            )
            newState = .success(data)

        case let .setAction(.failure(error)):
            newState = .failed(error.localizedDescription)

        }

        return newState
    }
}
