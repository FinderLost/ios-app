//
//  LoginReducer.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Redux

extension Login: Reducer {
    public static func reduce(_ action: Action, with state: State) -> State {
        var newState = state

        switch action {
        case .getUserSession:
            newState = .idle

        case
                .signIn,
                .signOut,
                .getInfo:
            newState = .loading

        case
            let .getInfoResult(.success(value)):
            let signIn = Login.Data(
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

        case
                .getUserSessionResult(.success),
                .signInResult(.success):
            break
        }

        return newState
    }
}
