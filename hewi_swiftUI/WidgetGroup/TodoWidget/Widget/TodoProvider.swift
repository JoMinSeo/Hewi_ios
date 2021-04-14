//
//  TodoProvider.swift
//  WidgetExtensionExtension
//
//  Created by 조민서 on 2021/04/13.
//

import WidgetKit

struct TodoProvider : TimelineProvider {
    
    typealias Entry = TodoEntry
    
    func placeholder(in context: Context) -> TodoEntry {
        
        let pr1 = Todo(title: "로딩즁", desc: "로딩즁", completed: false)
        let pr2 = Todo(title: "로딩즁2", desc: "로딩즁2", completed: false)
        
        let entry = TodoEntry(todo: [pr1, pr2])
        return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TodoEntry) -> Void) {
        
        let pr1 = Todo(title: "로딩즁", desc: "로딩즁", completed: false)
        let pr2 = Todo(title: "로딩즁2", desc: "로딩즁2", completed: false)
        
        let entry = TodoEntry(todo: [pr1,pr2])
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodoEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        
//        TodoManager.init() { todo in
//            let entry = TodoEntry(date: currentDate, todo: todo)
//            let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
//            completion(timeline)
//        }
    }
}
