//
//  LoginStateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Utilities

import Foundation

extension BuilderFake {
    public enum Login {
        public struct Data: Modifiable {
            var email: String = "Test User"
            var name: String = "test@email.com"
            var imageUrl: URL? = URL(
                string: "https://cdn.icon-icons.com/icons2/2468/PNG/512/user_kids_avatar_user_profile_icon_149314.png"
            )
            public init() {}
            public var entity: Module.LoginTCA.Data {
                .init(
                    email: email,
                    name: name,
                    imageUrl: imageUrl
                )
            }
        }
    }
}
