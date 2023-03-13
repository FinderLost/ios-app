//
//  NSErrorBuilderFake.swift
//
//
//  Created by Andres Felipe Alzate Restrepo on 14/2/23.
//

import Utilities

import Foundation

struct NSErrorBuilderFake: Modifiable {
    var domain: String = "Test"
    var code: Int = 0
    var userInfo: [String: Any]? = nil

    var entity: NSError {
        .init(
            domain: domain,
            code: code,
            userInfo: userInfo
        )
    }
}
