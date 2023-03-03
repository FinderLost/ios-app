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
    static var missingStateBuilderFake: BuilderFake.MissingTCABuiderFake.Data { .init() }
}

extension BuilderFake {
    enum MissingTCABuiderFake {
        struct Data: Modifiable {
            var publicList: [String] = ["publicList"]

            var entity: MissingTCA.Data {
                .init(
                    publicList: publicList
                )
            }
        }
    }
}
