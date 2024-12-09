//
//  ClosingSoonView.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/30/24.
//

import SwiftUI

struct ClosingSoonView: View {
    
    var title: String = "[NAVER Cloud] 의료 특화 초거대 언어모델 학습 데이터 구축"
    var companyName: String = "유한킴벌리"
    var deadline: String = "D-3"
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .foregroundStyle(.calBlue)
                .frame(width: 8, height: 118)
                .offset(x: -21, y: 0)
            
            
            VStack(alignment: .leading, spacing: 12) {
                Text(title)
                    .font(Font.custom("Pretendard", size: 14).weight(.medium))
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Image(.charleyrivers)
                        .frame(width: 32, height: 32)
                        .cornerRadius(20)
                    
                    Text("유한킴벌리")
                        .font(Font.custom("Inter", size: 11).weight(.medium))
                    
                    Spacer()
                        .frame(width: 20)
                        .padding(EdgeInsets(top: 0, leading: 55, bottom: 0, trailing: 0))
                    
                    Text(deadline)
                        .font(Font.custom("Pretendard", size: 14).weight(.medium))
                        .tracking(0.03)
                        .lineSpacing(21)
                        .foregroundColor(Color(red: 0.12, green: 0.67, blue: 0.38))
                }
            }
        }.frame(width: 246, height: 116)
            .background(.white)
            .cornerRadius(5)
            .shadow(
            color: Color(red: 0.88, green: 0.88, blue: 0.88, opacity: 1), radius: 4
            )
    }
}

#Preview {
    ClosingSoonView()
}
