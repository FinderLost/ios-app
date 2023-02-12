//
//  UserInfo.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

import Foundation

public protocol UserInfo {
    var name: String { get }
    var email: String { get }
    var imageUrl: URL? { get }
}
