//
//  LandMarksApp.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/30/24.
//

import ComposableArchitecture
import SwiftUI


@main
struct CounterApp: App {
  static let store = Store(initialState: AppFeature.State()) {
      AppFeature()
//      ._printChanges()
  }
  
  var body: some Scene {
    WindowGroup {
      AppView(store: CounterApp.store)
    }
  }
}
