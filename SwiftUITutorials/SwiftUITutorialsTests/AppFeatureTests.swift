//
//  AppFeatureTests.swift
//  SwiftUITutorialsTests
//
//  Created by 이명진 on 12/14/24.
//

import ComposableArchitecture
import Testing

@testable import SwiftUITutorials

@MainActor
struct AppFeatureTests {
    @Test
    func incrementInFirstTab() async {
        
        let store = TestStore(initialState: AppFeature.State()) {
            AppFeature()
        }
        
        await store.send(\.tab1.increaseButtonTapped) {
            $0.tab1.count = 1
        }
    }
}
