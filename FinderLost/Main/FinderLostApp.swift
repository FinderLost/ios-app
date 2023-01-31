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

    private let store = StoreImpl(initialState: FinderLost.State(), reducer: FinderLost.reduce)
        .use(LoginMiddleware1())
        .use(LoginMiddleware2())
        .use(FinderLost.handle)

    var body: some Scene {
        WindowGroup {
            TabBarView(store: store)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

// MARK: - ARCHITECTURE OK - ReduxBase
protocol ReduxBase<State, Action> {
    associatedtype State
    associatedtype Action
}

// MARK: - ARCHITECTURE OK - Reducer
typealias Reducer<State, Action> = (Action, State) -> State
protocol ReducerBase: ReduxBase {
    static func reduce(_ action: Action, with state: State) -> State
}

// MARK: - ARCHITECTURE OK - Middleware
typealias Middleware<State, Action> = (Action, State) -> AnyPublisher<Action, Never>
protocol MiddlewareBase: ReduxBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never>
}

// MARK: - ARCHITECTURE OK - Store
typealias Store<_Reducer: ReducerBase> = StoreImpl<_Reducer.State, _Reducer.Action>
final class StoreImpl<State, Action>: ObservableObject {
    @Published var state: State
    private let reducer: Reducer<State, Action>
    private var middlewares: [Middleware<State, Action>] = []
    private var middlewares1: [any Middleware1] = []
    private var middlewares2: [any Middleware2] = []
    private var cancellables: [AnyCancellable] = []

    init(
        initialState: State,
        reducer: @escaping Reducer<State, Action>
    ) {
        self.state = initialState
        self.reducer = reducer
    }

    func dispatch(_ action: Action) {
        middlewares.forEach { middleware in
            middleware(action, state)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }

        let context = MiddlewareContext(state: state, action: action, next: dispatch)
        middlewares1.forEach { middleware in
            middleware
                .handle(context: context)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }

        middlewares2.forEach { middleware in
            middleware
                .handle(action: action, state: state)
                .sink(receiveValue: dispatch)
                .store(in: &cancellables)
        }

        state = reducer(action, state)
    }

    @discardableResult
    func use(_ middleware: Middleware<State, Action>...) -> Self {
        middlewares += middleware
        return self
    }
    @discardableResult
    func use(_ middleware: any Middleware1...) -> Self {
        middlewares1 += middleware
        return self
    }
    @discardableResult
    func use(_ middleware: any Middleware2...) -> Self {
        middlewares2 += middleware
        return self
    }
}

// MARK: - Module FinderLost
enum FinderLost {
    struct State {
        var login: Login.State = .init()
    }

    enum Action {
        case login(Login.Action)
    }
}

// MARK: - FinderLost Reducer
extension FinderLost: ReducerBase {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .login(action):
            newState.login = Login.reduce(action, with: state.login)
        }
        return newState
    }
}

// MARK: - FinderLost Middleware
extension FinderLost: MiddlewareBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never> {
        switch action {
        case let .login(action):
            return Login
                .handle(action, with: state.login)
                .map(Action.login)
                .eraseToAnyPublisher()
        }
    }
}

// MARK: - Module Login
enum Login {
    struct State {
        var token: String = ""
        var error: String = ""
        var submodule: Submodule.State = .init()
    }
    enum Action {
        case checkLogin(Result<String, Error>)
        case checkAsync(String)
        case checkAsync1(String)
        case checkAsync2(String)
        case submodule(Submodule.Action)
    }
}

// MARK: - Login Reducer
extension Login: ReducerBase {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .checkLogin(.success(token)):
            newState.token = token
        case let .checkLogin(.failure(error)):
            newState.error = error.localizedDescription
        case let .submodule(.checkSubmodule(value)):
            newState.error = value
        case let .submodule(action):
            newState.submodule = Submodule.reduce(action, with: state.submodule)
        default: break
        }
        return newState
    }
}
// MARK: - Login Middleware
extension Login: MiddlewareBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never> {
        switch action {
        case let .submodule(action):
            return Submodule.handle(action, with: state.submodule)
                .map(Action.submodule)
                .eraseToAnyPublisher()

        case let .checkAsync(token):
            return Future { promise in
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    promise(.success(.checkLogin(.success("Middlewarer \(token)"))))
                }
            }.eraseToAnyPublisher()

        default: return Empty().eraseToAnyPublisher()
        }
    }
}

// MARK: - Module Submodule
enum Submodule {
    struct State {
        var value: String = ""
    }
    enum Action {
        case checkSubmodule(String)
        case checkAsync(String)
    }
}

// MARK: - Submodule Reducer
extension Submodule: ReducerBase {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state
        switch action {
        case let .checkSubmodule(value):
            newState.value = value
        default: break
        }
        return newState
    }
}
// MARK: - Submodule Middleware
extension Submodule: MiddlewareBase {
    static func handle(_ action: Action, with state: State) -> AnyPublisher<Action, Never> {
        Future { promise in
            switch action {
            case let .checkAsync(token):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    promise(.success(.checkSubmodule("Submodule: \(token)")))
                }
            default: break
            }
        }.eraseToAnyPublisher()
    }
}

// MARK: - EXPERIMENT - Middleware1
protocol Middleware1 {
    func handle<State, Action>(context: MiddlewareContext<State, Action>) -> AnyPublisher<Action, Never>
}
struct MiddlewareContext<State, Action> {
    let state: State
    let action: Action
    let next: (Action) -> Void
}
struct LoginMiddleware1: Middleware1 {
    func handle<State, Action>(context: MiddlewareContext<State, Action>) -> AnyPublisher<Action, Never> {
        Future { promise in
            guard let action = context.action as? FinderLost.Action else { promise(.success(context.action)); return }

            switch action {
            case let .login(.checkAsync1(token)):
                DispatchQueue.main.asyncAfter(deadline: .now()) {
                    let action = FinderLost.Action.login(.checkLogin(.success("Middleware1 \(token)")))
                    if let action = action as? Action {
                        promise(.success(action))
                    }
                }
            default: break
            }
        }.eraseToAnyPublisher()
    }
}

// MARK: - EXPERIMENT - Middleware2
protocol Middleware2 {
    func handle<State, Action>(action: Action, state: State) -> AnyPublisher<Action, Never>
}
struct LoginMiddleware2: Middleware2 {
    func handle<State, Action>(action: Action, state: State) -> AnyPublisher<Action, Never> {
        Future { promise in
            guard let action = action as? FinderLost.Action else { promise(.success(action)); return }
            switch action {
            case let .login(.checkAsync2(token)):
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    let action = FinderLost.Action.login(.checkLogin(.success("Middleware2 \(token)")))
                    if let action = action as? Action {
                        promise(.success(action))
                    }
                }
            default: break
            }
        }.eraseToAnyPublisher()
    }
}
