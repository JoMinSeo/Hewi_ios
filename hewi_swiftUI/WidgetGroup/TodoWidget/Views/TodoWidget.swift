//
//  TodoWidget.swift
//  WidgetExtensionExtension
//
//  Created by 조민서 on 2021/04/13.
//

import SwiftUI
import Intents
import WidgetKit

struct TodoWidget : Widget {
    private let kind: String = "TodoWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TodoProvider()) { entry in
            TodoEntryView(entry: entry)
        }
        .supportedFamilies([.systemSmall, .systemMedium])
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
