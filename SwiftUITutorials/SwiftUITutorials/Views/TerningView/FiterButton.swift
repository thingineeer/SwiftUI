//
//  FiterButton.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/30/24.
//

import SwiftUI

struct FiterButton: View {
    var body: some View {
        HStack(spacing: 4) {
            Image(.icFilter)
            
            Text("필터링")
                .font(.caption2)
                .foregroundStyle(.terningMain)
            
        }.padding(EdgeInsets(top: 1, leading: 2, bottom: 1, trailing: 9))
            .frame(width: 80, height: 30)
            .cornerRadius(5)
            .overlay(
            RoundedRectangle(cornerRadius: 5)
            .inset(by: 0.50)
            .stroke(.terningMain)
        )
    }
}

#Preview {
    FiterButton()
}
