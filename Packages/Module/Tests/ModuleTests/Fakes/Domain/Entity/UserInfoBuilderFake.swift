//
//  UserInfoBuilderFake.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import Domain
import Utilities

import Foundation

struct UserInfoBuilderFake: Modifiable {
    var name: String = "Test User"
    var email: String = "test@example.com"
    var imageUrl: URL? = nil

    var entity: UserInfo {
        UserInfoImpl(
            name: name,
            email: email,
            imageUrl: imageUrl
        )
    }

    private struct UserInfoImpl: UserInfo {
        let name: String
        let email: String
        let imageUrl: URL?
    }
}
