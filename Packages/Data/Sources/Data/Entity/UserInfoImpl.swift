//
//  UserInfoImpl.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Domain
import Foundation

struct UserInfoImpl: Domain.UserInfo {
    let name: String
    let email: String
    let imageUrl: URL?
}
