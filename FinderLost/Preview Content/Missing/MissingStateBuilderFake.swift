//
//  MissingStateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//

import Module
import Utilities

extension BuilderFake {
    public enum MissingTCA {
        public struct DataItem: Modifiable {
            public var name: String = "name"
            public var description: String = "description"
            public init() {}
            public var entity: Module.MissingTCA.DataItem {
                .init(
                    name: name,
                    description: description
                )
            }
        }
        public struct Data: Modifiable {
            public var publicList: [Module.MissingTCA.DataItem] = []
            public init() {}
            public var entity: Module.MissingTCA.Data {
                .init(
                    publicList: publicList
                )
            }
        }
    }
}
