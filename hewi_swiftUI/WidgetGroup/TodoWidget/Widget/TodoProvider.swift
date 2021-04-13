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
        let entry = TodoEntry(date: Date(), todo: String("로딩 중"))
        return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TodoEntry) -> Void) {
        let entry = TodoEntry(date: Date(), todo: String("안녕!"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodoEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        
        
    }
}
