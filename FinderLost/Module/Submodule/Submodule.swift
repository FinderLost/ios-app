//
//  Submodule.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

// MARK: - Module Submodule
enum Submodule {
    struct State {
        var value: String = ""
    }
    enum Action {
        case checkSubmodule(String)
        case checkAsync(String)
    }
}
