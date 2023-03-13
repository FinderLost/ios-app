//
//  MissingBuilderFake.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//

import Domain
import Utilities

struct MissingBuilderFake: Modifiable {
    var name: String = "name"
    var description: String = "description"

    var entity: Missing {
        MissingImpl(
            name: name,
            description: description
        )
    }

    private struct MissingImpl: Missing {
        let name: String
        let description: String
    }
}
