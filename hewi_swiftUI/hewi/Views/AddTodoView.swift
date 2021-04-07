//
//  AddTodoView.swift
//  hewi
//
//  Created by 조민서 on 2021/04/07.
//

import SwiftUI

struct AddTodoView : View {
    @EnvironmentObject var modelData : ToDoViewModel
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Title")) {
                    TextField("", text: $modelData.title)
                }
                
                Section(header: Text("Detail")) {
                    TextField("", text: $modelData.desc)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(modelData.updateObject == nil ? "Add Data" : "Update")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {modelData.addData(presentation: presentation)}, label: {
                        Text("Done")
                    })
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {presentation.wrappedValue.dismiss()}, label: {
                        Text("Cancel")
                    })
                }
            }
        }
        .onAppear(perform: modelData.setUpInitData)
        .onDisappear(perform: modelData.deInitData)
    }
}
