//
//  FinderLostApp.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 16/12/22.
//

import Redux
import SwiftUI
import DesignSystem

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
            let _ = DSAppereance.setAppearance()
            let _ = store.use(HandlerDI.login())
            let _ = store.use(HandlerDI.missing())
            TabBarView()
                .environmentObject(store)
        }
    }
}
