//
//  MissingTCA+Action.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux
import Domain

extension MissingTCA {
    public enum Action: ReduxAction {
        case getMissingList
        case setMissingList(Result<[Missing], Error>)
    }
}
