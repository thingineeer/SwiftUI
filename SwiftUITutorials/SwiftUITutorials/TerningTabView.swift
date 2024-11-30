//
//  TerningTabView.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/12/24.
//

import SwiftUI

// 홈 화면
struct HomeView: View {
    var body: some View {
        NavigationStack {
            Text("홈 화면")
                .navigationTitle("홈")
        }
    }
}

// 캘린더 화면
struct CalendarView: View {
    var body: some View {
        NavigationStack {
            Text("캘린더 화면")
                .navigationTitle("캘린더")
        }
    }
}

// 탐색 화면
struct SearchView: View {
    var body: some View {
        NavigationStack {
            Text("탐색 화면")
                .navigationTitle("탐색")
        }
    }
}

// 마이페이지 화면
struct MyPageView: View {
    var body: some View {
        NavigationStack {
            Text("마이페이지 화면")
                .navigationTitle("마이페이지")
        }
    }
}

// SwiftUI 탭바 구현
struct TNTabBarView: View {
    @State private var selectedTab: TNTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("홈", image: selectedTab == .home ? .icHomeFill : .icHome)
                    }
                    .tag(TNTab.home)
                
                CalendarView()
                    .tabItem {
                        Label("캘린더", image: selectedTab == .calendar ? .icCalendarFill : .icCalendar)
                    }
                    .tag(TNTab.calendar)
                
                SearchView()
                    .tabItem {
                        Label("탐색", image: selectedTab == .search ? .icSearchFill : .icSearch)
                    }
                    .tag(TNTab.search)
                
                MyPageView()
                    .tabItem {
                        Label("마이페이지", image: selectedTab == .myPage ? .icPersonFill : .icPerson)
                    }
                    .tag(TNTab.myPage)
            }
            .accentColor(.terningMain) // 탭바 아이콘 선택 색상
            .shadow(color: Color(red: 0.95, green: 0.95, blue: 0.95), radius: 1, x: 10, y: -100) // Figma의 shadow 설정
        }
    }
}


// 탭 열거형
enum TNTab: Hashable {
    case home
    case calendar
    case search
    case myPage
}


#Preview {
    TNTabBarView()
}
