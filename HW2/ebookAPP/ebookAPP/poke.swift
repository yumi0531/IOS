//
//  poke.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/20.
//
//定義資料的型別時，通常選擇 Swift File
//定義代表pokemon資料的型別poke
//建立一個型別（類似全域的）struct
import Foundation
struct Poke: Identifiable{
    let id = UUID()//以 UUID 當 id，固定用法
    let name: String
    let Area:String
    let Attribute: String
}

//用 static 宣告的變數(常數) 儲存 SwiftUI preview 呈現的假資料
extension Poke {
    static let demoPoke = Poke(name: "小火龍", Area: "洗翠",Attribute: "火" )
    }
