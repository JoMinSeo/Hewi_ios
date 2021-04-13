//
//  TodoWidget.swift
//  TodoWidget
//
//  Created by 조민서 on 2021/04/13.
//

import WidgetKit
import SwiftUI

@main
struct TodoWidget: Widget {
    let kind: String = "TodoWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: TodoProvider()) { entry in
            TodoWidgetEntryView(entry: entry)
        }
        .configurationDisplayName(kind)
        .description("This is an example widget.")
    }
}

struct TodoWidget_Previews: PreviewProvider {
    static var previews: some View {
        TodoWidgetEntryView(entry: TodoEntry(date: Date()))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
