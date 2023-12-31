//
//  ModelData.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/17.
//

import Foundation
import Combine


final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json") // An observable object needs to publish any changes to its data,
                                                                    // so that its subscribers can pick up the change.
}
/*
 SwiftUI subscribes to your observable object,
 and updates any views that need refreshing when the data changes.
 */


// Create a load(_:) method that fetches JSON data with a given name from the app’s main bundle.

func load<T: Decodable>(_ filename: String) -> T { // The load method relies on the return type’s conformance to the Decodable protocol,
                                                   // which is one component of the Codable protocol.
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

/*

 The Decodable protocol is used for decoding (or deserializing) data from an external representation.
 If a type conforms to Decodable, it means that instances of that type can be created from external data,
 such as JSON or property lists.
 
 */
