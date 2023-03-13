//
//  LoginStateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Module
import Utilities

import Foundation

extension BuilderFake {
    enum LoginTCA {
        struct Data: Modifiable {
            var email: String = "Test User"
            var name: String = "test@email.com"
            var imageUrl: URL? = URL(
                string: "https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png"
            )
            init() {}
            var entity: Module.LoginTCA.Data {
                .init(
                    email: email,
                    name: name,
                    imageUrl: imageUrl
                )
            }
        }
    }
}
