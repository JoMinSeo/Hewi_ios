//
//  TodoEntry.swift
//  WidgetExtensionExtension
//
//  Created by 조민서 on 2021/04/13.
//

import WidgetKit
import RealmSwift

struct TodoEntry : TimelineEntry {
    var date = Date()
    var todo : [Todo]
}

class Todo: Object, Identifiable{
    @objc dynamic var id : Int = 0
    @objc dynamic var title : String = ""
    @objc dynamic var desc : String = ""
    @objc dynamic var completed : Bool = false

    // 기본키 설정
    override class func primaryKey() -> String? {
        return "id"
    }

    convenience init(title: String, desc: String, completed : Bool) {
        self.init()
        self.title = title
        self.desc = desc
        self.completed = completed
    }
}
