//
//  SearchView.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 22/1/23.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var store: Store<FinderLost>

    var body: some View {
        Text("\(store.state.login.error)")
    }
}
