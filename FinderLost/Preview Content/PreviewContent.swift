//
//  PreviewContent.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 18/2/23.
//

import Redux

protocol PreviewContent {
    static var stateBuilderFake: BuilderFake.FinderLostBF.StateBuilderFake { get }
    static func storeBuilderFake(
        initialState: FinderLost.State,
        reducer: @escaping Reduce<FinderLost.Action, FinderLost.State>,
        context: @escaping Context<FinderLost.Action, FinderLost.State>
    ) -> Store<FinderLost>
}
