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
        IntentConfiguration(kind: kind, intent: WidgetKindIntent.self ,provider: TodoProvider()) { entry in
            TodoEntryView(entry: entry)
        }
        .configurationDisplayName("ToDo 위젯")
        .description("작성한 ToDo를 볼 수 있습니다.")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}
