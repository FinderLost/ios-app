//
//  FirebaseFirestoreApiService.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import FirebaseFirestore

protocol FirebaseFirestoreApiService {
    var firestore: Firestore { get }
    var collectionName: String { get }
    var collectionReference: CollectionReference { get }
}

extension FirebaseFirestoreApiService {
    var collectionReference: CollectionReference {
        firestore.collection(collectionName)
    }
}
