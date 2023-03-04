//
//  MissingFirebaseApiService.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 1/3/23.
//

import Combine

import Factory

import FirebaseFirestore
import FirebaseFirestoreCombineSwift

final class MissingFirebaseApiService: MissingApiService, FirebaseFirestoreApiService {
    @Injected(FirebaseDI.firestore)
    var firestore: Firestore

    let collectionName = "missing"

    func getMissingList() -> AnyPublisher<[MissingResponse], Error> {
        collectionReference.getDocuments()
            .map(\.documents)
            .eraseToAnyPublisher()
            .decodeMany()
            .eraseToAnyPublisher()
    }
}
