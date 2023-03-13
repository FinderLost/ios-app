//
//  MissingTCA+State.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux
import Domain

import Foundation

public enum MissingTCA {
    public struct DataItem: ReduxState, Identifiable, Hashable {
        public var id: UUID = UUID()
        public let name: String
        public let description: String
        public init(
            id: UUID = UUID(),
            name: String,
            description: String
        ) {
            self.id = id
            self.name = name
            self.description = description
        }
    }
    public struct Data: ReduxState {
        public let publicList: [DataItem]
        public init(publicList: [MissingTCA.DataItem]) {
            self.publicList = publicList
        }
    }
    public enum State: ReduxState {
        case success(Data)
        case failed(String)
        case loading
        case idle

        public var isLoading: Bool {
            if case .loading = self { return true }
            return false
        }
        public var hasData: Data? {
            guard case let .success(state) = self else { return nil }
            return state
        }
        public var hasError: String? {
            guard case let .failed(error) = self else { return nil }
            return error
        }
    }
}
