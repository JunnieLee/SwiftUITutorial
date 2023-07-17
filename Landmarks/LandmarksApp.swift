//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Junhee Lee on 2023/07/14.
//

import SwiftUI

@main // The @main attribute identifies the app’s entry point.
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    // 앱의 수명 동안 특정 속성에 대해 모델 객체를 한 번만 초기화하기 위해 @StateObject 속성을 사용합니다.
    // 이는 여기에서 보여진 대로 앱 인스턴스에서 해당 속성에 대해 속성을 사용할 때뿐만 아니라 뷰에서 사용할 때에도 적용됩니다.
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
