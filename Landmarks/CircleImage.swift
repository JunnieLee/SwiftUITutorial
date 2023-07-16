//
//  CircleImage.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/16.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        // pass the name of the image to display
        Image("turtlerock")
            .clipShape(Circle())
            // The Circle type is a shape that you can use as a mask, or as a view by giving the circle a stroke or fill.
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
