//
//  ContainerDI+Handler.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Redux

import Factory

extension Container {
    static let loginHandler = Factory<HandlerOf<FinderLost>>(scope: .singleton) { Login.HandlerImpl() }
}
