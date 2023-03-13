//
//  UserSessionBuilderFake.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import Domain
import Utilities

struct UserSessionBuilderFake: Modifiable {
    var token: String = "abc123"
    var userId: String = "user123"

    var entity: UserSession {
        UserSessionImpl(
            token: token,
            userId: userId
        )
    }
    private struct UserSessionImpl: UserSession {
        let token: String
        let userId: String
    }
}
