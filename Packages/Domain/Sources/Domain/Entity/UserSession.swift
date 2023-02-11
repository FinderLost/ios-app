//
//  UserSession.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 8/2/23.
//

public protocol UserSession {
    var token: String { get }
    var userId: String { get }
}
