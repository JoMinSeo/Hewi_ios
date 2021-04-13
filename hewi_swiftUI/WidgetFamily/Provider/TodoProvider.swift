//
//  TodoProvider.swift
//  hewi
//
//  Created by 조민서 on 2021/04/13.
//

import WidgetKit

struct TodoProvider: TimelineProvider {
    typealias Entry = TodoEntry
    
    func placeholder(in context: Context) -> TodoEntry {
        let entry = TodoEntry(date: Date(), todo: String("안녕하세요"))
        return entry
    }
    
    func getSnapshot(in context: Context, completion: @escaping (TodoEntry) -> Void) {
        let entry = TodoEntry(date: Date(), todo: String("안녕하세요2"))
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<TodoEntry>) -> Void) {
        let currentDate = Date()
        let refreshDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
        
        //            ExchangeRateManager.currentRate { (todo) in
        //                let entry = TodoEntry(date: currentDate, todo: todo)
        //                let timeline = Timeline(entries: [entry], policy: .after(refreshDate))
        //                completion(timeline)
        //            }
    }
}
