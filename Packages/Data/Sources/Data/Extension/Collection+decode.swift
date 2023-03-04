//
//  Collection+decode.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import FirebaseFirestore

extension Collection where Element: QueryDocumentSnapshot {
    /// An extension to decode Firestore QueryDocumentSnapshots to a specified Decodable type.
    ///
    /// - returns: An array of the decoded results.
    func decode<Decode: Decodable>() -> [Decode] {
        compactMap { $0.decode() }
    }
}
