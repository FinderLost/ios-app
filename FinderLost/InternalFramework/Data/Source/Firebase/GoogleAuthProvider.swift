//
//  GoogleAuthProvider.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 8/2/23.
//

import Combine
import Factory
import Firebase
import GoogleSignIn

protocol GoogleAuthProviderI {
    func getCredential(userSession: UserSession) -> AuthCredential
    func signIn() -> AnyPublisher<UserSession, Error>
}

final class GoogleAuthProviderImpl: GoogleAuthProviderI {
    @Injected(Container.firebaseApp)
    private var firebaseApp: FirebaseApp?

    func signIn() -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            guard let clientID = self.firebaseApp?.options.clientID else { return }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)
            GIDSignIn.sharedInstance.configuration = config

            // Start the sign in flow!
            GIDSignIn.sharedInstance.signIn(
                withPresenting: UIApplication.shared.firstRootViewController ?? .init()
            ) { result, error in
                if let error {
                    promise(.failure(error))
                }

                if
                    let user = result?.user,
                    let userId = user.idToken?.tokenString {
                    let userSession = UserSessionImpl(
                        token: user.accessToken.tokenString,
                        userId: userId
                    )
                    promise(.success(userSession))
                }
            }
        }.eraseToAnyPublisher()
    }

    func getCredential(userSession: UserSession) -> AuthCredential {
        GoogleAuthProvider.credential(
            withIDToken: userSession.userId,
            accessToken: userSession.token
        )
    }
}

extension UIApplication {
    var firstWindowScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first as? UIWindowScene
    }
    var firstRootViewController: UIViewController? {
        firstWindowScene?.windows.first?.rootViewController
    }
}
