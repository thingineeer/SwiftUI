//
//  ContentView.swift
//  SwiftUITutorials
//
//  Created by 이명진 on 11/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            MapView()
                .frame(height: 300)
            
            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)
            
            Text("Turtle Rock")
                .font(.title)
                .foregroundColor(.black)
            HStack {
                Text("joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
            
            Divider()
            
            Text("About Turtle Rock")
                .font(.title2)
            Text("Descriptive text goes here.")
            
        }
        .padding()
        
        Spacer()

    }
}

#Preview {
    ContentView()
}
