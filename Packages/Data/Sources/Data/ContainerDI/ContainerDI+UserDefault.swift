//
//  ContainerDI+UserDefault.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Factory

extension Container {
    static let userSessionUserDefault = Factory<UserSessionUserDefault>(scope: .singleton) {
        UserSessionUserDefaultImpl()
    }
}
