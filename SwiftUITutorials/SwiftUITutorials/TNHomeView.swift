//
//  TNHomeView.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/12/24.
//

import SwiftUI

struct TNHomeView: View {
    var body: some View {
        VStack {
            HStack {
                Image(.homeLogo)
            }
            .padding(.leading, 24)
            .frame(width: 375, height: 52, alignment: .leading)
            .background(.white)
            
            HStack {
                Text("곧 마감되는 남지우님의 관심 공고")
                  .font(
                    Font.custom("Pretendard", size: 20)
                      .weight(.semibold)
                  )
                  .foregroundColor(Color(red: 0.09, green: 0.09, blue: 0.09))
                  .padding(.leading, 24)
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    TNHomeView()
}
