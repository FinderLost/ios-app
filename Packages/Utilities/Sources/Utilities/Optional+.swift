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
    /// A Boolean value indicating whether the optional value is nil.
    public var isNil: Bool { self == nil }
    /// A Boolean value indicating whether the optional value is not nil.
    public var isNotNil: Bool { self != nil }
}
