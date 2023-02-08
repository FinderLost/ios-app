//
//  UserRepository.swift
//  FinderLost
//
//  Created by Andres Felipe Alzate Restrepo on 31/1/23.
//

import Combine
import Factory

protocol UserRepository {
    func getUserSession() -> AnyPublisher<UserSession, Error>
}

class UserRepositoryImpl: UserRepository {
    @Injected(Container.userSessionUserDefault)
    private var userSessionUserDefault: UserSessionUserDefault

    func getUserSession() -> AnyPublisher<UserSession, Error> {
        Future { [weak self] promise in
            guard let self else { return }
            guard
                self.userSessionUserDefault.sessionToken.isNotEmpty,
                self.userSessionUserDefault.userId.isNotEmpty
            else { return promise(.failure(CError.isEmpty)) }
            let userSession = UserSession(
                token: self.userSessionUserDefault.sessionToken,
                userId: self.userSessionUserDefault.userId
            )
            promise(.success(userSession))
        }.eraseToAnyPublisher()
    }
}
