//
//  Contextor.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

typealias Context<Action, State> = (Action, State) -> any HandlerContext
protocol Contextor: Redux {
    static func context(_ action: Action, with state: State) -> any HandlerContext
}
