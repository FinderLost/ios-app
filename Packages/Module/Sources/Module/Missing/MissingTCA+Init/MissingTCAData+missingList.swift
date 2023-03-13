//
//  MissingTCAData+missingList.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//

import Domain

extension MissingTCA.Data {
    init(missingList: [Missing]) {
        self.init(
            publicList: missingList.map(MissingTCA.DataItem.init)
        )
    }
}

private extension MissingTCA.DataItem {
    init(missing: Missing) {
        self.init(
            name: missing.name,
            description: missing.description
        )
    }
}
