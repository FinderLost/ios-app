//
//  String+.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 8/2/23.
//

extension String {
    ///
    /// An extension to the `String` type that provides an easy way to check if a string is not empty.
    ///
    /// Use `isNotEmpty` property to check if the string is not empty. It returns true if the string is not empty, false otherwise.
    ///
    public var isNotEmpty: Bool { isEmpty.not }
}
