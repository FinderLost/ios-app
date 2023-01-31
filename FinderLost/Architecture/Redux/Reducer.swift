//
//  Reducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - ARCHITECTURE OK - Reducer
typealias Reducer<State, Action> = (Action, State) -> State
protocol ReducerBase: ReduxBase {
    static func reduce(_ action: Action, with state: State) -> State
}
