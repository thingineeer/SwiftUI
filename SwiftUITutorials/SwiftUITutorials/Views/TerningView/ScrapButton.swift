//
//  ScrapButton.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/30/24.
//

import SwiftUI

struct ScrapButton: View {
    @State var isScrap: Bool = false
    
    var body: some View {
        Button {
            isScrap.toggle()
        } label: {
            Image(isScrap ? .icScrapFill : .icScrap)
        }
    }
}

#Preview {
    ScrapButton(isScrap: .init(true))
}
