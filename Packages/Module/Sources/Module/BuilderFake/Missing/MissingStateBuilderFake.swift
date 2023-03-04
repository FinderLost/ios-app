//
//  MissingStateBuilderFake.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//

import Utilities

extension BuilderFake {
    public enum MissingTCA {
        public struct DataItem: Modifiable {
            var name: String = "name"
            public var entity: Module.MissingTCA.DataItem {
                .init(
                    name: name
                )
            }
        }
        public struct Data: Modifiable {
            var publicList: [Module.MissingTCA.DataItem] = []
            public init() {}
            public var entity: Module.MissingTCA.Data {
                .init(
                    publicList: publicList
                )
            }
        }
    }
}
