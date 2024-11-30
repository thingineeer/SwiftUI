//
//  LandMarksApp.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/30/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
