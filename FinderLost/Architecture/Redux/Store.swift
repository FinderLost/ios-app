//
//  Store.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Factory

// MARK: - ARCHITECTURE OK - Store
typealias Store<_Reducer: ReducerBase> = StoreImpl<_Reducer.Action, _Reducer.State>
final class StoreImpl<Action, State>: ObservableObject {
    @Published var state: State
    private let reducer: Reducer<Action, State>
    private let context: Context<Action, State>
    private var handlers: [any HandlerProcotol<Action, State>] = []
    private var cancellables: [AnyCancellable] = []

    init(
        initialState: State,
        reducer: @escaping Reducer<Action, State>,
        context: @escaping Context<Action, State>
    ) {
        self.state = initialState
        self.reducer = reducer
        self.context = context
    }

    func dispatch(_ action: Action) {
        let context = context(action, state)
        handlers.forEach { handler in
            handler.handle(context)
                .compactMap { action in
                    return context.nextAction(action)
                }
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }

        state = reducer(action, state)
    }

    @discardableResult
    func use(_ handler: any HandlerProcotol<Action, State>...) -> Self {
        handlers += handler
        return self
    }
}

// MARK: - HandlerProcotol
protocol HandlerProcotol<Action, State>: ReduxBase {
    func handle(_ context: some HandlerContextProtocol) -> AnyPublisher<Action, Never>
}

// MARK: - Context
typealias Context<Action, State> = (Action, State) -> any HandlerContextProtocol

// MARK: - HandlerContextProtocol
protocol HandlerContextProtocol {
    associatedtype Action
    associatedtype ActionOutput
    associatedtype State
    var action: Action { get }
    var state: State { get }
    var next: (Action) -> ActionOutput { get }
    func nextAction<NextAction>(_ buildAction: Action) -> NextAction?
}

// MARK: - HandlerContext
class HandlerContext<Action, State, ActionOutput>: HandlerContextProtocol {
    typealias Action = Action
    typealias ActionOutput = ActionOutput
    typealias State = State

    var action: Action
    var state: State
    var next: (Action) -> ActionOutput

    init(action: Action, state: State, next: @escaping (Action) -> ActionOutput) {
        self.action = action
        self.state = state
        self.next = next
    }

    func nextAction<NextAction>(_ buildAction: Action) -> NextAction? {
        next(buildAction) as? NextAction
    }
}

// MARK: - Module Login
extension FinderLost {
    static func context(_ action: Action, with state: State) -> any HandlerContextProtocol {
        switch action {
        case let .login(action):
            return HandlerContext(action: action, state: state.login, next: Action.login)
        }
    }
}

// MARK: - Module Login
enum Login {
    struct State {
        var userId: String = ""
        var error: String = ""
    }
    enum Action {
        case checkSession
        case checkSessionResult(Result<String, Error>)
    }
}

// MARK: - Handler Login
extension Login {
    class Handler<Action, State>: HandlerProcotol {
        @Injected(Container.userRepository)
        private var userRepository: UserRepository

        func handle(_ context: some HandlerContextProtocol) -> AnyPublisher<Action, Never> {
            guard let action = context.action as? Login.Action else { return Empty().eraseToAnyPublisher() }
            switch action {
            case .checkSession:
                return userRepository.checkSession()
                    .compactMap { Login.Action.checkSessionResult(.success($0)) as? Action }
                    .catch { Just(Login.Action.checkSessionResult(.failure($0)) as! Action) }
                    .eraseToAnyPublisher()
            default: return Empty().eraseToAnyPublisher()
            }
        }
    }
}
