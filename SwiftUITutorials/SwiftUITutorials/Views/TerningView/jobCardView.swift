//
//  jobCardView.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/30/24.
//

struct AnnouncementModel: Codable {
    let internshipAnnouncementId: Int
    let companyImage: String
    let dDay: String
    let title: String
    let workingPeriod: String
    var isScrapped: Bool
    let color: String?
    let deadline: String
    let startYearMonth: String
    let companyInfo: String?
}

import SwiftUI

struct jobCardView: View {
    var model: AnnouncementModel
    
    var body: some View {
        ZStack() {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 76, height: 76)
                .background(Color(red: 0.87, green: 0.87, blue: 0.87))
                .cornerRadius(5)
                .offset(x: -113.50, y: 0)
            
            Text("D-2")
                .font(Font.custom("Pretendard", size: 14).weight(.semibold))
                .tracking(0.03)
                .foregroundColor(Color(red: 0.12, green: 0.67, blue: 0.38))
                .offset(x: -55, y: -31)
            
            Text(model.title)
                .font(Font.custom("Pretendard", size: 15).weight(.medium))
                .tracking(0.03)
                .lineSpacing(1)
                .foregroundColor(.black)
                .frame(width: 250, height: 40, alignment: .topLeading)
                .offset(x: 59, y: -2)
            
            HStack(spacing: 4) {
                Text("근무기간")
                    .font(Font.custom("Pretendard", size: 12).weight(.light))
                    .tracking(0.02)
                    .lineSpacing(14.40)
                    .foregroundColor(Color(red: 0.40, green: 0.40, blue: 0.40))
                Text(model.workingPeriod)
                    .font(Font.custom("Pretendard", size: 12).weight(.light))
                    .tracking(0.02)
                    .foregroundColor(Color(red: 0.12, green: 0.67, blue: 0.38))
            }
            .offset(x: -30.50, y: 31)
            
            ZStack() {
                ScrapButton(isScrap: model.isScrapped)
            }
            .frame(width: 28, height: 28)
            .offset(x: 137.50, y: 26)
        }
        .padding(.horizontal, 45)
        .frame(height: 100)
        .background(.white)
        .cornerRadius(10)
        .shadow(
            color: Color(red: 0.88, green: 0.88, blue: 0.88, opacity: 1), radius: 4
        )
    }
}
#Preview {
    
    let dummyAnnouncement = AnnouncementModel(
        internshipAnnouncementId: 101,
        companyImage: "https://example.com/company_logo.png",
        dDay: "D-5",
        title: "UX/UI 디자이너 인턴 모집",
        workingPeriod: "3개월",
        isScrapped: true,
        color: "#FF5733",
        deadline: "2024-12-31",
        startYearMonth: "2024-12",
        companyInfo: "국내 최대 디자인 전문 기업으로, UI/UX 분야에 강점을 가지고 있습니다."
    )
    let dummyAnnouncement2 = AnnouncementModel(
        internshipAnnouncementId: 101,
        companyImage: "https://example.com/company_logo.png",
        dDay: "D-5",
        title: "[Someone] 콘텐츠 마케터 대학생 인턴 채용",
        workingPeriod: "6개월",
        isScrapped: false,
        color: "#FF5733",
        deadline: "2024-12-31",
        startYearMonth: "2024-12",
        companyInfo: "국내 최대 디자인 전문 기업으로, UI/UX 분야에 강점을 가지고 있습니다."
    )
    
    Group {
        jobCardView(model: dummyAnnouncement)
        jobCardView(model: dummyAnnouncement2)
    }
    
    
}
