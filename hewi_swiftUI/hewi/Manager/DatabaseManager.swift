//
//  DatabaseManager.swift
//  hewi
//
//  Created by 조민서 on 2021/04/07.
//

import Foundation
import RealmSwift

class DatabseManager {
    static let shared = DatabseManager()
    
    private let realm : Realm
    
    private init() {
        realm = try! Realm()
    }
}
