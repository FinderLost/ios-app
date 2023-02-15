//
//  Result+.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 15/2/23.
//

extension Result {
    public var success: Success? {
        guard case let .success(value) = self else { return nil }
        return value
    }
    public var failure: Failure? {
        guard case let .failure(error) = self else { return nil }
        return error
    }
}
