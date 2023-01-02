//
//  StoreItem.swift
//  FinalProject
//
//  Created by yumi on 2022/12/7.
//

import Foundation
//遵從 protocol Codable 後， StoreItem將有解碼跟編碼的功能
//可存檔
struct StoreItem: Codable,Identifiable{
    var id: String{name}
    var name: String
    var image_link: String
    var family_friendly: Int?
    var origin: String?//出生地
    var max_weight: Int?//最大體重
    var intelligence: Int?
    var other_pets_friendly:Int?
    var max_life_expectancy:Int?
    var isSave: Bool?
}

extension String: Identifiable {
    public var id: String {
        self
    }
}




