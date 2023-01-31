//
//  FinderLostApp.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 16/12/22.
//

import SwiftUI
import Combine

@main
struct FinderLostApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    private let store = StoreImpl(
        initialState: FinderLost.State(),
        reducer: FinderLost.reduce
    )
        .use(FinderLost.handle)

    var body: some Scene {
        WindowGroup {
            TabBarView(store: store)
                .edgesIgnoringSafeArea(.all)
        }
    }
}
