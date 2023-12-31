//
//  MapView.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/17.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    // You use the @State attribute.
    // SwiftUI manages the underlying storage and automatically updates views that depend on the value.
    @State private var region = MKCoordinateRegion()
    
    var body: some View {
        // By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value.
        Map(coordinateRegion: $region)
        // When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.
        .onAppear {
            setRegion(coordinate)
        }
        // Add an onAppear view modifier to the map that triggers a calculation of the region based on the current coordinate.
    }
    
    // Add a method that updates the region based on a coordinate value.
    private func setRegion(_ coordinate: CLLocationCoordinate2D) {
        region = MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
    }
}
