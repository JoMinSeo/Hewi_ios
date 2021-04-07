//
//  TodoListItem.swift
//  hewi
//
//  Created by 조민서 on 2021/04/07.
//

import SwiftUI

struct TodoListItem : View {
    
    //var todo: Todo
    
    var title : String
    var completed : Bool
    
    var body: some View {
        HStack {
            
            Image(systemName: completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            
            Text(title)
            
        }
    }
}
