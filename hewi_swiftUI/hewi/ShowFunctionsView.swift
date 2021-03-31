//
//  ShowFunctionsView.swift
//  hewi
//
//  Created by 조민서 on 2021/03/31.
//

import SwiftUI
import Foundation


struct Row: Identifiable {
    let id = UUID()
    let cells: [Cell]
}

extension Row {
    static func all() -> [Row] {
        return [
            
            Row(cells: [Cell(imageURL: "logo"), Cell(imageURL: "Image")]),
            Row(cells: [Cell(imageURL: "Image"), Cell(imageURL: "Image")])
            
        ]
    }
}

struct Cell: Identifiable {
    let id = UUID()
    let imageURL: String
}

struct ShowFunctionsView : View {
    
    //@State private var showingAlert = false
    
    let row = Row.all()
    
    var body: some View {
        VStack {
            
            Text("Hewi")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
                .padding()
            
            Spacer()
            
            List {
                ForEach(row) { row in
                    HStack(alignment: .center) {
                        ForEach(row.cells) { cell in
                            Image(cell.imageURL)
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            
            //            HStack {
            //
            //                Button(action: {
            //                    self.showingAlert = true
            //                }, label: {
            //                    Image(systemName: "plus")
            //                }).alert(isPresented: $showingAlert) {
            //                    Alert(title: Text("버튼 클릭"), message: Text("Alert 띄우기"), dismissButton: .default(Text("Dismiss")))
            //                }
            //                .buttonStyle(PlainButtonStyle())
            //                .frame(width: 30, height: 30)
            //
            //                Spacer()
            //
            //                Button(action: {
            //
            //                }, label: {
            //                    Image(systemName: "gear")
            //                })
            //                .buttonStyle(PlainButtonStyle())
            //                .frame(width: 30, height: 30)
            //
            //            }
            //        }.frame(width: 200, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}
