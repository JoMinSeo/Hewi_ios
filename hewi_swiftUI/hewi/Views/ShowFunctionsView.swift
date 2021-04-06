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
//
//struct Row: Identifiable {
//    let id = UUID()
//    let cells: [ImageButton]
//}
//
//extension Row {
//    static func all() -> [Row] {
//        return [
//            Row(cells: [ImageButton(imageURL: "Album", name: "Album"),ImageButton(imageURL: "Dday", name: "D-day"),]),
//            Row(cells: [ImageButton(imageURL: "ToDo", name: "ToDo"),ImageButton(imageURL: "logo", name: "mola")])
//        ]
//    }
//}


struct ShowFunctionsView : View {
    
    //@State private var showingAlert = false
    
    //@State private var isLinkActive = false
    @State private var selectedItem: UUID? = nil
    
    var buttons = [
        ImageButton(imageURL: "Album", name: "Album"),
        ImageButton(imageURL: "Dday", name: "D-day"),
        ImageButton(imageURL: "ToDo", name: "ToDo"),
        ImageButton(imageURL: "logo", name: "mola")
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
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    .toolbar(content: {
                        ToolbarItem(placement: .principal, content: {
                            Text("Hewi")
                        })
                    })
                
                LazyVGrid(columns: columns, spacing: 30) {
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
                                    
                                }
                            )
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: 130, height: 130)
                            
                            Text(button.name)
                                .font(.title3)

                        }                    }
                }.padding(.all, 20)
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    
    func SettingView(name: String?) -> AnyView {
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

//.background(
//                NavigationLink(destination: Text("OtherView"), isActive: $isLinkActive) {
//                    EmptyView()
//                }
//                .hidden()
//            )
