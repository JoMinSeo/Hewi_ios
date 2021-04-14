//
//  TodoModel.swift
//  hewi
//
//  Created by 조민서 on 2021/04/06.
//

import RealmSwift

class Todo: Object, Identifiable{
    @objc dynamic var id : Int = 0 // id
    @objc dynamic var title : String = "" // 제목
    @objc dynamic var desc : String = "" // 내용
    @objc dynamic var timestamp: Date = Date() // 날짜, 시간
    @objc dynamic var completed : Bool = false // 완료 여부
    
    // 기본키 설정
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(title: String, desc: String, timestamp: Date, completed : Bool) {
        self.init()
        self.title = title
        self.desc = desc
        self.timestamp = timestamp
        self.completed = completed
    }
    
}

