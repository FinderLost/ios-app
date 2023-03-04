//
//  MissingImpl.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 3/3/23.
//

import Domain

struct MissingImpl: Missing {
    let name: String
    let description: String
}

extension MissingImpl {
    init?(response: MissingResponse) {
        guard
            let name = response.name,
            let description = response.description
        else { return nil }
        self.init(
            name: name,
            description: description
        )
    }
}
