//
//  LoginTCA+Action.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//

import Redux
import Domain

extension LoginTCA {
    public enum Action: ReduxAction {
        case getUserSession
        case setUserSession(Result<UserSession, Error>)
        case getSignIn
        case setSignIn(Result<UserSession, Error>)
        case getSignOut
        case setSignOut(Result<Void, Error>)
        case getInfo
        case setInfo(Result<UserInfo, Error>)
    }
}
