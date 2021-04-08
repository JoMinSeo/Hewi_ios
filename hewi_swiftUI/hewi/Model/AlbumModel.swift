//
//  AlbumModel.swift
//  hewi
//
//  Created by 조민서 on 2021/04/08.
//

import RealmSwift

class AlbumModel: Object {
    @objc dynamic var id : Int = 0
    @objc dynamic var albumName : String = ""
    @objc dynamic var imageURL : String = ""
    let images = RealmSwift.List<Images>()
    
    // 기본키 설정
    override class func primaryKey() -> String? {
        return "id"
    }
    
}

class Images: EmbeddedObject {
    @objc dynamic var albumName : String = ""
    @objc dynamic var imageURL : String = ""
    
    convenience init(albumName : String, imageURL : String) {
        self.init()
        self.albumName = albumName
        self.imageURL = imageURL
    }
}
