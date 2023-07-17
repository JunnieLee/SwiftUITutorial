//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/18.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool
    // 바인딩을 사용하면 뷰 내에서 수행된 변경 사항이 데이터 소스로 전파됩니다.
    
    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                // The title string that you provide for the button’s label
                // doesn’t appear in the UI when you use the iconOnly label style,
                // but VoiceOver uses it to improve accessibility.
                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true))
    }
}
