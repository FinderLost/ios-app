//
//  MissingStateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//

import Module
import Utilities

import Foundation

extension PreviewContent {
    static var missingStateBuilderFake: BuilderFake.MissingBuiderFake.Data { .init() }
}

extension BuilderFake {
    enum MissingBuiderFake {
        struct Data: Modifiable {
            var privateList: [String] = ["privateList"]
            var publicList: [String] = ["publicList"]

            var entity: Missing.Data {
                .init(
                    privateList: privateList,
                    publicList: publicList
                )
            }
        }
    }
}
