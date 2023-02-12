//
//  SignInBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Utilities

extension Login {
    struct SignInBuilderFake: Modifiable {
        var userId: String = ""
        var name: String = ""
        var email: String = ""

        var entity: Login.SignIn {
            .init(
                userId: userId,
                email: email,
                name: name
            )
        }
    }
}
