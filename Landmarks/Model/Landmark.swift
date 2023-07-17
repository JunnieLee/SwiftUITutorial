//
//  Landmark.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/17.
//

import Foundation
import SwiftUI
import CoreLocation

/*
 1. The Hashable protocol is used to provide a hash value for a type,
    allowing instances of that type to be used in hash-based data structures like Set and Dictionary
 
 2. Adding Codable conformance makes it easier to move data between the structure and a data file.
    You’ll rely on the Decodable component of the Codable protocol later in this section to read data from file.
*/

struct Landmark: Hashable, Codable, Identifiable { // The Landmark data already has the id property required by Identifiable protocol
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    /*
     You mark this property as private because you’ll use it only
     to create a public computed property in the next step.
    */
    var locationCoordinate: CLLocationCoordinate2D {
            CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
