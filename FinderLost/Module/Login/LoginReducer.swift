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
            let .signInResult(.success(value)),
            let .getUserSessionResult(.success(value)):
            // TODO: - other way to reuse the last state
            let signIn = SignIn(
                userId: value.userId,
                email: state.lastSignIn?.email ?? "",
                name: state.lastSignIn?.name ?? "",
                imageUrl: state.lastSignIn?.imageUrl
            )
            newState = .signIn(signIn)

        case
            let .getInfoResult(.success(value)):
            // TODO: - other way to reuse the last state
            let signIn = SignIn(
                userId: state.lastSignIn?.userId ?? "",
                email: value.email,
                name: value.name,
                imageUrl: value.imageUrl
            )

            newState = .signIn(signIn)

        case .signOutResult(.success):
            newState = .signOut

        case
                let .getUserSessionResult(.failure(error)),
                let .signInResult(.failure(error)),
                let .signOutResult(.failure(error)),
                let .getInfoResult(.failure(error)):
            newState = .error(error.localizedDescription)
            print("limit::\(#function)\(error.localizedDescription)")
            // TODO: - update the error on view
        }

        return newState
    }
}
