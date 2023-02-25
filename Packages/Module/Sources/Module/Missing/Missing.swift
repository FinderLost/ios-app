//
//  Missing.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 25/2/23.
//  
//

import Redux

public enum Missing {
    public struct Data: ReduxState {
        public var privateList: [String]
        public var publicList: [String]
        public init(
            privateList: [String],
            publicList: [String]
        ) {
            self.privateList = privateList
            self.publicList = publicList
        }
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
        case getAction
        case setAction(Result<Void, Error>)
    }
}
