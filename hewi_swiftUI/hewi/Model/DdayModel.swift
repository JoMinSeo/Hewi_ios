//
//  DdayModel.swift
//  hewi
//
//  Created by 조민서 on 2021/04/08.
//

import RealmSwift

class DdayModel : Object, Identifiable {
    @objc dynamic var id : Int = 0
    @objc dynamic var startDate : Date = Date()
    @objc dynamic var content : String = ""
    //@objc dynamic var textColor : UIColor = UIColor.black
    @objc dynamic var imageURL : String = ""
    
    // 기본키 설정
    override class func primaryKey() -> String? {
        return "id"
    }
    
    convenience init(startDate: Date, content : String, imageURL : String) {
        self.init()
        self.startDate = startDate
        self.content = content
        //self.textColor = textColor
        self.imageURL = imageURL
    }
}
