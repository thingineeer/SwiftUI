//
//  CounterFeatureTests.swift
//  SwiftUITutorialsTests
//
//  Created by 이명진 on 12/13/24.
//

import ComposableArchitecture
import Testing

@testable import SwiftUITutorials

@MainActor
struct CounterFeatureTests {
    @Test
    func basics() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }
        
        await store.send(.increaseButtonTapped) {
            $0.count = 1
        }
        await store.send(.decreaseButtonTapped) {
            $0.count = 0
        }
    }
    
    @Test
    func timer() async {
        let clock = TestClock()
        
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        } withDependencies: {
            $0.continuousClock = clock
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = true
        }
        await clock.advance(by: .seconds(1))
        
        await store.receive(\.timerTick) {
            $0.count = 1
        }
        
        await store.send(.toggleTimerButtonTapped) {
            $0.isTimerRunning = false
        }
    }
    
    @Test
    func numberFact() async {
        let store = TestStore(initialState: CounterFeature.State()) {
            CounterFeature()
        }  withDependencies: {
            $0.numberFact.fetch = { "\($0) is a good number." }
        }
        
        await store.send(.factButtonTapped) {
            $0.isLoading = true
        }
        
        await store.receive(\.factResponse) {
          $0.isLoading = false
          $0.fact = "0 is a good number."
        }
    }
}
