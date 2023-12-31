//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/17.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
                (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView{
            /*
             Lists work with identifiable data. You can make your data identifiable in one of
             two ways: by passing along with your data a key path to a property that uniquely
             identifies each element, or by making your data type conform to the Identifiable
             protocol.
             */
            List {
                Toggle(isOn:$showFavoritesOnly){
                    // use the $ prefix to access a binding to a state variable
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark:landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // Completed the dynamically-generated list
            // by returning a LandmarkRow from the closure.
            .navigationTitle("Landmarks")
            // Call the navigationTitle(_:) modifier method to set the title of the navigation bar when displaying the list.
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
            // The modelData property gets its value automatically, as long as the environmentObject(_:) modifier has been applied to a parent.
        
        /*
        // When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
        ForEach(["iPhone SE (3rd generation)", "iPhone 14 Pro Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName) // Use the previewDisplayName(_:) modifier to add                              // the device names as labels for the previews.
        }
        // You can specify the device to use in the active scheme, in code, or by previewing directly on your device.
        */
    }
}
