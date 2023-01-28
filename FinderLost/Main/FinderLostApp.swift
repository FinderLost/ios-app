//
//  FinderLostApp.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 16/12/22.
//

import SwiftUI

@main
struct FinderLostApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let appState: AppState
    private let store: Store<AppState, AppAction>

    init() {
        self.appState = AppState()
        self.store = Store(initialState: appState, reducer: appReducer)
    }

    var body: some Scene {
        WindowGroup {
            TabBarView(store: store)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
