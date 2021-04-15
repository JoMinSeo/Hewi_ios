//
//  WidgetGroup.swift
//  WidgetGroup
//
//  Created by 조민서 on 2021/04/13.
//

import WidgetKit
import SwiftUI
import Intents

@main
struct WidgetGroup: WidgetBundle {
    
    @WidgetBundleBuilder
    var body: some Widget {
        TodoWidget()
    }
}
