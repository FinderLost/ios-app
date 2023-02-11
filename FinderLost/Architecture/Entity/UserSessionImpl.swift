//
//  UserSessionImpl.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Domain

struct UserSessionImpl: UserSession {
    let token: String
    let userId: String
}
