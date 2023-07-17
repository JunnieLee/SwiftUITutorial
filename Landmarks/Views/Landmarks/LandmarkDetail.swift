//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/17.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
        // In Swift, the .firstIndex() method is used to find the index
        // of the first occurrence of a given element in an array.
        
        // In Swift, an "implicitly unwrapped optional" is a type that
        // combines the features of both an optional and a non-optional type.
        // It is denoted by adding an exclamation mark (!) at the end of
        // the type declaration.
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top)
                .frame(height: 300)

            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack{
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet:$modelData.landmarks[landmarkIndex].isFavorite)
                    // provide a binding to the isFavorite property with the dollar sign ($)
                }
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)

                Divider()

                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        /*
         The navigation changes only have an effect
         when the view is part of a navigation stack.
         */
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: modelData.landmarks[0])
    }
}
