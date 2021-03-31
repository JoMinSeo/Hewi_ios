//
//  ContentView.swift
//  hewi
//
//  Created by 조민서 on 2021/03/22.
//

import SwiftUI

struct ContentView: View {
    
    let data = Array(1...100).map { "Item \($0)" }
    
    private var columns : [GridItem] = [
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16)
    ]
    
    var body: some View {
        VStack {
            Text("HeWi")
                .font(.title)
                .foregroundColor(.black)
                .padding()
            
            Spacer()
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20){
                    ForEach(data, id: \.self){ item in
                        Text(item)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
