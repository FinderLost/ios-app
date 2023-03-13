//
//  MissingTCA+DataItemBuilderFake.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//

import Module
import Utilities

import Foundation

extension MissingTCA {
    struct DataItemBuilderFake: Modifiable {
        var id: UUID = UUID()
        var name: String = "name"
        var description: String = "description"

        var entity: MissingTCA.DataItem {
            .init(
                id: id,
                name: name,
                description: description
            )
        }
    }
}
