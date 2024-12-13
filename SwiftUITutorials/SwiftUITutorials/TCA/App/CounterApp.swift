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
  static let store = Store(initialState: CounterFeature.State()) {
    CounterFeature()
      ._printChanges()
  }
  
  var body: some Scene {
    WindowGroup {
      CounterView(store: CounterApp.store)
    }
  }
}
