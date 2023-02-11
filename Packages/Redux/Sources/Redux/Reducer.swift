//
//  Reducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

public typealias Reduce<Action, State> = (Action, State) -> State
public protocol Reducer: Redux {
    static func reduce(_ action: Action, with state: State) -> State
}
