//
//  LoginTCA+Reducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux

extension LoginTCA: Reducer {
    public static func reduce(_ action: Action, with state: State) -> State {
        var newState = state

        switch action {
        case .getUserSession:
            newState = .idle

        case
                .getSignIn,
                .getSignOut,
                .getInfo:
            newState = .loading

        case
            let .setInfo(.success(value)):
            let signIn = LoginTCA.Data(
                email: value.email,
                name: value.name,
                imageUrl: value.imageUrl
            )

            newState = .signIn(signIn)

        case .setSignOut(.success):
            newState = .signOut

        case
                let .setUserSession(.failure(error)),
                let .setSignIn(.failure(error)),
                let .setSignOut(.failure(error)),
                let .setInfo(.failure(error)):
            newState = .failed(error.localizedDescription)

        case
                .setUserSession(.success),
                .setSignIn(.success):
            break
        }

        return newState
    }
}
