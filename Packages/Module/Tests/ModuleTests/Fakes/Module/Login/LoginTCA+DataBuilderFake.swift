//
//  LoginTCA+DataBuilderFake.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Utilities

import Foundation
@testable import Module

extension LoginTCA {
    struct DataBuilderFake: Modifiable {
        var name: String = "test@email.com"
        var email: String = "Test User"
        var imageUrl: URL? = URL(string: "https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png")

        var entity: LoginTCA.Data {
            .init(
                email: email,
                name: name,
                imageUrl: imageUrl
            )
        }
    }
}
