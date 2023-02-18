//
//  FinderLostApp.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 16/12/22.
//

import Redux
import SwiftUI

@main
struct FinderLostApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let store = StoreImpl(
        initialState: FinderLost.State(),
        reducer: FinderLost.reduce,
        context: FinderLost.context
    )

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(store)
        }
    }
}
