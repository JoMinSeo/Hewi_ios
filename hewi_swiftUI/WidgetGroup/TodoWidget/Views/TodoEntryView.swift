//
//  TodoEntryView.swift
//  WidgetExtensionExtension
//
//  Created by 조민서 on 2021/04/13.
//

import SwiftUI

struct TodoEntryView : View {
    
    let entry : TodoEntry
    
    var body: some View {
        ZStack {
            Color(.white)
            VStack(spacing: 10) {
                HStack(spacing: 5) {
                    Text("안")
                        .font(.largeTitle)
                        .padding(10)
                        .background(Color(.cyan))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                    Text("안2")
                        .bold()
                        .foregroundColor(Color.black.opacity(0.7))
                }
                HStack(spacing: 5) {
                    Text("안")
                        .font(.largeTitle)
                        .padding(10)
                        .background(Color(.brown))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 5, x: -5, y: -5)
                    Text("안3")
                        .bold()
                        .foregroundColor(Color.black.opacity(0.7))
                }
            }.padding()
        }.edgesIgnoringSafeArea(.all)
    }
}
