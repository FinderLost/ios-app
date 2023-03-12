//
//  QueryDocumentSnapshot+decode.swift
//  
//
//  Created by Andres Felipe Alzate Restrepo on 4/3/23.
//

import Utilities

import FirebaseFirestore
import FirebaseFirestoreSwift

extension QueryDocumentSnapshot {
    /// Decodes the data of the snapshot into an instance of the specified type.
    ///
    /// - parameter Decode: The type of the instance to decode the data into.
    /// - returns: The decoded instance, or nil if the decoding fails.
    func decode<Decode: Decodable>() -> Decode? {
        do {
            return try data(as: Decode.self)
        } catch {
            triggerAssertionFailure("\n\nFile: \(#file)\n\nError: \(error.localizedDescription)")
            return nil
        }
    }
}
