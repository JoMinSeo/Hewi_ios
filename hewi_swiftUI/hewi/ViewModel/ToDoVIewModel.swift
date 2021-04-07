//
//  ToDoVIewModel.swift
//  hewi
//
//  Created by 조민서 on 2021/04/07.
//

import SwiftUI
import RealmSwift

class ToDoViewModel: ObservableObject {
    @Published var title = ""
    @Published var desc = ""
    
    @Published var todos : [Todo] = []
    
    @Published var openNewPage = false
    
    @Published var updateObject : Todo?
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let db = try? Realm() else{return}
        
        let results = db.objects(Todo.self)
        
        self.todos = results.compactMap({ (todo) -> Todo? in
            return todo
        })
    }
    
    func addData(presentation: Binding<PresentationMode>){
        if title == "" || desc == ""{return}
        
        let todo = Todo()
        todo.title = title
        todo.desc = desc
        
        guard let db = try? Realm() else {return}
        
        try? db.write {
            guard let availableObject = updateObject else {
                db.add(todo)
                return
            }
            availableObject.title = title
            availableObject.desc = desc
        }
        
        fetchData()
        
        presentation.wrappedValue.dismiss()
    }
    
    func deleteData(object: Todo){
        guard let db = try? Realm() else {return}
        
        try? db.write {
            db.delete(object)
            
            fetchData()
        }
    }
    
    func setUpInitData(){
        guard let updateData = updateObject else {return}
        
        title = updateData.title
        desc = updateData.desc
    }
    
    func deInitData(){
        updateObject = nil
        title = ""
        desc = ""
    }
}
