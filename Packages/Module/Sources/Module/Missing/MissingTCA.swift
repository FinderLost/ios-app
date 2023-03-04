//
//  MissingTCA.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux
import Domain

import Foundation

public enum MissingTCA {
    public struct DataItem: ReduxState, Identifiable {
        public var id: UUID = UUID()
        public let name: String
        public let description: String
    }
    public struct Data: ReduxState {
        public let publicList: [DataItem]
    }
    public enum State: ReduxState {
        case idle
        case success(Data)
        case loading
        case failed(String)

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
    public enum Action: ReduxAction {
        case getMissingList
        case setMissingList(Result<[Missing], Error>)
    }
}
