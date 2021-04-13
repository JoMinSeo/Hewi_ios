//
//  TodoWidget.swift
//  hewi
//
//  Created by 조민서 on 2021/04/13.
//

import SwiftUI
import WidgetKit

struct TodoWidget : Widget {
    let kind: String = "TodoWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: TodoProvider()) { entry in
            TodoEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
