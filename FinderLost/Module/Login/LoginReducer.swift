//
//  LoginReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux

extension Login: Reducer {
    static func reduce(_ action: Action, with state: State) -> State {
        var newState = state

        switch action {
        case .signIn, .signOut, .getUserSession, .getInfo:
            newState = .loading

        case
            let .getUserSessionResult(.success(value)),
            let .signInResult(.success(value)):
            let signIn = SignIn(
                userId: value.userId,
                email: state.lastSignIn?.email ?? "",
                name: state.lastSignIn?.name ?? ""
            )
            newState = .signIn(signIn)

        case
            let .getInfoResult(.success(value)):
            let signIn = SignIn(
                userId: state.lastSignIn?.userId ?? "",
                email: value.email,
                name: value.name
            )

            newState = .signIn(signIn)

        case
                .getUserSessionResult(.failure),
                .signInResult(.failure),
                .signOutResult(.failure),
                .signOutResult(.success),
                .getInfoResult(.failure):
            newState = .signOut

        default: break
        }

        return newState
    }
}
