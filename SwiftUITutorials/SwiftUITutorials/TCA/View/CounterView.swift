//
//  CounterView.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 12/13/24.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            
            Text("\(store.count)")
                .font(.title3)
            
            HStack {
                Button("-") {
                    store.send(.decreaseButtonTapped)
                }.font(.largeTitle)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                
                
                Button("+") {
                    store.send(.increaseButtonTapped)
                }.font(.largeTitle)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                
                Button(store.isTimerRunning ? "Stop timer" : "Start timer") {
                    store.send(.toggleTimerButtonTapped)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            }
            
            Button("Fact") {
                store.send(.factButtonTapped)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
            
            if store.isLoading {
                ProgressView()
            } else if let fact = store.fact {
                Text(fact)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
        }
    }
}

#Preview {
    CounterView(store: Store(initialState: CounterFeature.State(), reducer: {
        CounterFeature()
    }))
}
