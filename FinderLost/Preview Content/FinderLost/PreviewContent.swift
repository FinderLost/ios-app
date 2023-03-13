//
//  PreviewContent.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Redux
import Module

// MARK: - Store BF
protocol PreviewContent {
    static func storeBuilderFake(
        initialState: FinderLost.State,
        reducer: @escaping Reduce<FinderLost.Action, FinderLost.State>,
        context: @escaping Context<FinderLost.Action, FinderLost.State>
    ) -> Store<FinderLost>
}

// MARK: - Module state BF
extension PreviewContent {
    static var loginStateBuilderFake: BuilderFake.LoginTCA.Data { .init() }
    static var missingStateBuilderFake: BuilderFake.MissingTCA.Data { .init() }
    static var missingItemBuilderFake: BuilderFake.MissingTCA.DataItem { .init() }
}
