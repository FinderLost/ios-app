//
//  Modifiable.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 11/2/23.
//

/// A protocol that can be adopted by types that can be modified.
public protocol Modifiable {}
public extension Modifiable {
    /// Modifies a property of an object by setting it to a new value.
    ///
    /// - Parameters:
    ///   - keyPath: The key path of the property to modify.
    ///   - value: The new value to set the property to.
    ///
    /// - Returns: The modified object.
    ///
    /// If the `keyPath` is not castable to a `WritableKeyPath`, this function will return a copy of the original object
    /// without modifying anything and log an assertion failure.
    @discardableResult func set<T>(_ keyPath: KeyPath<Self, T>, _ value: T) -> Self {
        var copy = self
        guard let keyPath = keyPath as? WritableKeyPath else {
            assertionDebug("KeyPath not casteable to WritableKeyPath ")
            return copy
        }
        copy[keyPath: keyPath] = value
        return copy
    }
}
