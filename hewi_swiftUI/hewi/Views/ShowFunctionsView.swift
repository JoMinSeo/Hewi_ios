//
//  ShowFunctionsView.swift
//  hewi
//
//  Created by 조민서 on 2021/03/31.
//

import SwiftUI

struct ImageButton : Identifiable{
    var id = UUID()
    var imageURL = String()
}

struct ShowFunctionsView : View {
    
    //@State private var showingAlert = false
    @State private var barhidden = true
    
    let paths = [
        ImageButton(imageURL: "logo"),
        ImageButton(imageURL: "logo"),
        ImageButton(imageURL: "logo"),
        ImageButton(imageURL: "logo")
    ]
    
    let columns : [GridItem] = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Hewi")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 30) {
                        ForEach(paths) { path in
                            Button(action: {
                                
                            }, label: {
                                Image(path.imageURL)
                                    .resizable()
                                    .scaledToFit()
                            })
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 130, height: 130)
                        }
                    }
                    .padding(.all, 20)
                }
                
            }
            .navigationBarTitle("Navigation View")
            .navigationBarHidden(barhidden)
        }
    }
}

struct ShowFunctionsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowFunctionsView()
    }
}
