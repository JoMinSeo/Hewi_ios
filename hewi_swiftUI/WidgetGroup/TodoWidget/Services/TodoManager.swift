//
//  TodoManager.swift
//  WidgetGroupExtension
//
//  Created by 조민서 on 2021/04/13.
//

import RealmSwift
import WidgetKit

class TodoManager : ObservableObject{
    
    @Published var todos : [Todo] = []
    
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
}
