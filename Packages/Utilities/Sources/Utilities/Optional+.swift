//
//  Optional+.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 10/2/23.
//

protocol AnyOptional {
    var isNil: Bool { get }
    var isNotNil: Bool { get }
}

extension Optional: AnyOptional {
    public var isNil: Bool { self == nil }
    public var isNotNil: Bool { self != nil }
}
