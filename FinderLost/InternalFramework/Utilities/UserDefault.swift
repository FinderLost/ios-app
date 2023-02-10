//
//  UserDefault.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 26/1/23.
//

import Foundation

@propertyWrapper
struct UserDefault<Value> {
    private let key: String
    private let defaultValue: Value

    init(_ key: String, defaultValue: Value) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: Value {
        get { UserDefaults.standard.object(forKey: key) as? Value ?? defaultValue }
        set { UserDefaults.standard.set(newValue, forKey: key) }
    }
}
