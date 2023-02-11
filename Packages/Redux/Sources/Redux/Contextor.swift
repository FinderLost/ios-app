//
//  Contextor.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 6/2/23.
//

public typealias Context<Action, State> = (Action, State) -> any HandlerContext
public protocol Contextor: Redux {
    static func context(_ action: Action, with state: State) -> any HandlerContext
}
