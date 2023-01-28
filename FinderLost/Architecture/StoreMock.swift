//
//  StoreMock.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 28/1/23.
//

import SwiftUI

extension PreviewProvider {
    static var storeMock: Store<AppState, AppAction> {
        let appState =  AppState()
        return Store<AppState, AppAction>(
            initialState: appState,
            reducer: appReducer
        )
    }
}
