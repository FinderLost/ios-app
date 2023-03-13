//
//  MissingTCA+DataBuilderFake.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 13/3/23.
//

import Module
import Utilities

extension MissingTCA {
    struct DataBuilderFake: Modifiable {
        var publicList: [DataItem] = [DataItemBuilderFake().entity]

        var entity: MissingTCA.Data {
            .init(
                publicList: publicList
            )
        }
    }
}
