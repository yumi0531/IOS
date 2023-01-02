//
//  DogStroreItem.swift
//  FinalProject
//
//  Created by yumi on 2023/1/2.
//
import Foundation

struct DogStoreItem: Codable,Identifiable{
    var id: String{name}
    var name: String
    var image_link: String
    var protectiveness: Int?
    var trainability: Int?
    var good_with_other_dogs: Int?
    var other_pets_friendly:Int?
    var max_life_expectancy:Int?
    var min_weight_male:Double?
    var min_weight_female:Double?
    var isSave: Bool?
}



