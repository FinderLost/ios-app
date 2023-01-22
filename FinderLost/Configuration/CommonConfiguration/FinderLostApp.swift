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

    var body: some Scene {
        WindowGroup {
            let appState =  AppState(
                userName: "",
                userEmail: ""
            )
            let store = Store(
                initialState: appState,
                reducer: appReducer
            )
            TabBarView(store: store)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
