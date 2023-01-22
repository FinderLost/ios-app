//
//  AppState.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

struct AppState: Codable {
    var userName: String
    var userEmail: String
}

extension AppState: Equatable {
    static func ==(lhs: AppState, rhs: AppState) -> Bool {
        lhs.userName == rhs.userName &&
               lhs.userEmail == rhs.userEmail
    }
}
