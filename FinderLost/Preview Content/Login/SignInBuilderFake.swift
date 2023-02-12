//
//  SignInBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Utilities

import Foundation

extension Login {
    struct SignInBuilderFake: Modifiable {
        var userId: String = ""
        var name: String = ""
        var email: String = ""
        var imageUrl: URL? = URL(string: "https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png")

        var entity: Login.SignIn {
            .init(
                userId: userId,
                email: email,
                name: name,
                imageUrl: imageUrl
            )
        }
    }
}
