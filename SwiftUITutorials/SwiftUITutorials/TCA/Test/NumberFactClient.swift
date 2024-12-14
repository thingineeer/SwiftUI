//
//  NumberFactClient.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 12/13/24.
//

import ComposableArchitecture
import Foundation


public struct NumberFactClient {
    var fetch: (Int) async throws -> String
}


extension NumberFactClient: DependencyKey {
    public static let liveValue = Self(
        fetch: { number in
            let (data, _) = try await URLSession.shared
                .data(from: URL(string: "http://numbersapi.com/\(number)")!)
            return String(decoding: data, as: UTF8.self)
        }
    )
}

extension DependencyValues {
    var numberFact: NumberFactClient {
        get { self[NumberFactClient.self] }
        set { self[NumberFactClient.self] = newValue }
    }
}
