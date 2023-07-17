//
//  ContentView.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/14.
//

import SwiftUI

// The first structure conforms to the View protocol and describes the view’s content and layout.
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

// The second structure declares a preview for that view.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
        // Update the ContentView preview to add the model object to the environment, which makes the object available to any subview.
        // A preview fails if any subview requires a model object in the environment, but the view you are previewing doesn’t have the environmentObject(_:) modifier.
    }
}
