//
//  Result+.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 15/2/23.
//

extension Result {
    ///
    /// Returns the success value of a Result instance if it exists, otherwise returns nil.
    ///
    /// - Returns: The success value of a Result instance if it exists, otherwise returns nil.
    public var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    ///
    /// Returns the failure value of a Result instance if it exists, otherwise returns nil.
    ///
    /// - Returns: The failure value of a Result instance if it exists, otherwise returns nil.
    public var failure: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
