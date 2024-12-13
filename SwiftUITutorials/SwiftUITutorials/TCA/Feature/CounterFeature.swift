//
//  CounterFeature.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 12/13/24.
//

import ComposableArchitecture

@Reducer
struct CounterFeature {
    
    @ObservableState
    
    // 기능이 작업을 수행하는 데 필요한 상태를 저장하는 State
    struct State {
        var count = 0
    }
    
    // 기능에서 수행할 수 있는 모든 작업을 포함하는 Action
    enum Action {
        case decreaseButtonTapped // 보통 작업의 이름을 그대로 따서 짓는 것이 가장 좋다.
        case increaseButtonTapped
    }
    
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                case .decreaseButtonTapped:
                state.count -= 1
                return .none
            case .increaseButtonTapped:
                state.count += 1
                return .none
            }
            
        }
    }
}
