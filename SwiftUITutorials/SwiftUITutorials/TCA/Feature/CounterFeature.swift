//
//  CounterFeature.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 12/13/24.
//

import ComposableArchitecture
import Foundation

@Reducer
struct CounterFeature {
    
    @ObservableState
    
    // 기능이 작업을 수행하는 데 필요한 상태를 저장하는 State
    struct State {
        var count = 0
        var isLoading = false
        var fact: String?
        var isTimerRunning = false
    }
    
    // 기능에서 수행할 수 있는 모든 작업을 포함하는 Action
    enum Action {
        case decreaseButtonTapped // 보통 작업의 이름을 그대로 따서 짓는 것이 가장 좋다.
        case increaseButtonTapped
        case factButtonTapped
        case factResponse(String)
        case toggleTimerButtonTapped
        case timerTick
    }
    
    enum CancelID { case timer }
    
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .decreaseButtonTapped:
                state.count -= 1
                state.fact = nil
                return .none
            case .increaseButtonTapped:
                state.count += 1
                state.fact = nil
                return .none
            case let .factResponse(fact):
                state.fact = fact
                state.isLoading = false
                return .none
            case .factButtonTapped:
                state.fact = nil
                state.isLoading = true
                
                return .run { [count = state.count] send in
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "http://numbersapi.com/\(count)")!)
                    let fact = String(decoding: data, as: UTF8.self)
                    await send(.factResponse(fact))
                }
            case .timerTick:
                state.count += 1
                state.fact = nil
                return .none
                
            case .toggleTimerButtonTapped:
                state.isTimerRunning.toggle()
                if state.isTimerRunning {
                    return .run { send in
                        while true {
                            try await Task.sleep(for: .seconds(1))
                            await send(.timerTick)
                        }
                    }
                    .cancellable(id: CancelID.timer)
                } else {
                    return .cancel(id: CancelID.timer)
                    
                }
            }
        }
    }
}
