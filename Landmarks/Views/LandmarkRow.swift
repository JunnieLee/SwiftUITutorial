//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/17.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landmark: Landmark
    
    var body: some View {
        HStack{
            landmark.image
                .resizable()
                .frame(width:50, height:50)
            Text(landmark.name)
            
            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        /*
         Group is a container for grouping view content.
         Xcode renders the group’s child views as separate previews in the canvas.
         */
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
        // Use the previewLayout(_:) modifier
        // to set a size that approximates a row in a list.
        
    }
}
