//
//  UserSessionUserDefault.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 26/1/23.
//

struct UserSessionUserDefault {
    @UserDefault("userId", defaultValue: "")
    var userId: String
    @UserDefault("sessionToken", defaultValue: "")
    var sessionToken: String
}
