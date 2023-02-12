//
//  Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine

public typealias Store<_Reducer: Reducer> = StoreImpl<_Reducer.Action, _Reducer.State>
final public class StoreImpl<Action, State>: ObservableObject {
    @Published public var state: State
    private let reduce: Reduce<Action, State>
    private let context: Context<Action, State>
    private var handlers: [any Handler<Action, State>] = []
    private var cancellables: [ AnyCancellable] = []

    public init(
        initialState: State,
        reducer: @escaping Reduce<Action, State>,
        context: @escaping Context<Action, State>
    ) {
        self.state = initialState
        self.reduce = reducer
        self.context = context
    }

    public func dispatch(_ action: Action) {
        state = reduce(action, state)
        
        let context = context(action, state)
        handlers.forEach { handler in
            handler.handle(context)
                .map(context.nextAction)
                .mapCast(Action.self)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }
    }

    @discardableResult
    public func use(_ handler: any Handler<Action, State>...) -> Self {
        handlers += handler
        return self
    }
}
