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
    var name = String()
}

struct ShowFunctionsView : View {
    
    //@State private var showingAlert = false
    @State private var selectedItem: UUID? = nil
    
    private var buttons = [
        ImageButton(imageURL: "Album", name: "Album"),
        ImageButton(imageURL: "Dday", name: "D-day"),
        ImageButton(imageURL: "ToDo", name: "ToDo"),
        ImageButton(imageURL: "logo", name: "mola")
    ]
    
    let columns : [GridItem] = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Hewi")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
                
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(buttons) { button in
                        VStack {
                            
                            Button(action: {
                                self.selectedItem = button.id
                            }, label: {
                                Image(button.imageURL)
                                    .resizable()
                                    .scaledToFit()
                            }).background(
                                NavigationLink(destination: SettingView(name: button.name), tag: button.id, selection: $selectedItem) {
                                    EmptyView()
                                }
                            )
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 130, height: 130)
                            
                            Text(button.name)
                                .font(.title3)
                            
                        }
                    }
                }
                
            }
            .frame(width: 300, height: 100, alignment: .bottom)
            .padding(.all, 20)
                        
            .navigationBarHidden(true)
            .navigationBarTitle(Text("Home"))
                        
        }
    }
    
    //name을 받아 View를 리턴해주는 함수
    private func SettingView(name: String?) -> AnyView {
        switch name {
        case "Album":
            return AnyView(AlbumView())
        case "D-day":
            return AnyView(DdayView())
        case "ToDo":
            return AnyView(TodoView())
        case "mola":
            return AnyView(EmptyView())
        default:
            print("navigation error 입니다.")
            return AnyView(EmptyView())
        }
    }
}

struct ShowFunctionsView_Previews: PreviewProvider {
    static var previews: some View {
        ShowFunctionsView()
    }
}
