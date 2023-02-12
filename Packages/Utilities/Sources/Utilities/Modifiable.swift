//
//  Modifiable.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

public protocol Modifiable {}
public extension Modifiable {
    @discardableResult
    func set<T>(_ keyPath: KeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        guard let keyPath = keyPath as? WritableKeyPath else {
            assertionFailure("KeyPath not casteable to WritableKeyPath ")
            return copy
        }
        copy[keyPath: keyPath] = value
        return copy
    }
}
