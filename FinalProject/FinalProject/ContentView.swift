//
//  ContentView.swift
//  FinalProject
//
//  Created by yumi on 2022/12/7.
//

import SwiftUI
import Foundation
import FBSDKLoginKit

struct ContentView: View {
    @Binding var showCatPage :Bool
    @EnvironmentObject var fetcher: DataFetcher
    @StateObject private var saver = DataSaver()
    @State private var showError = false
    @State private var error: Error?
    let searchTerms = ["品種","家庭友好度","寵物友好度","最大年齡"]
    let selectTerms = ["name","family_friendly","other_pets_friendly","max_life_expectancy"]
    let promptTerms = ["請輸入英文品種名","請輸入0~5","請輸入0~5","請輸入搜尋年齡"]
    @State private var selectedIndex = 0
    @State private var selectNum = ""
    @State private var currentValue1 = 6
    @State private var searchText = ""
    var items: [StoreItem] {
        var items = [StoreItem]()
        for var item in fetcher.items {
            let isContain = saver.items.contains {
                $0.name == item.name
            }
            if isContain {
                print("isContain")
                item.isSave = true
            } else {
                print("isNotContain")
                item.isSave = false
            }
            items.append(item)
        }
        return items
    }
    var body: some View {
        TabView{
            NavigationView {
                ZStack {
                    Color(red: 248/255, green: 232/255, blue: 209/255)
                        .ignoresSafeArea()
                    VStack{
                        //search
                        VStack{
                            VStack{
                                VStack{
                                HStack {
                                    
                                    Picker(selection: $selectedIndex) {
                                        Text(searchTerms[0]).tag(0)
                                        Text(searchTerms[1]).tag(1)
                                        Text(searchTerms[2]).tag(2)
                                        Text(searchTerms[3]).tag(3)
                                        
                                    } label: {
                                        Text("篩選條件")
                                    }
                                    .font(.custom("jf-openhuninn-1.1", size: 10))
                                    TextField(promptTerms[selectedIndex],text:$selectNum)
                                    Button{
                                        fetcher.fetchData(searchTerm: selectTerms[selectedIndex], searchNum: String(selectNum))
                                    }label: {
                                        Image(systemName: "magnifyingglass")
                                    }
                                    Button{
                                        showCatPage = false
                                    }label: {
                                        Text("上一頁")
                                        .background(Color(red:252/255,green:244/255,blue:241/255))
                                        .foregroundColor(Color.black)
                                        .clipShape(Capsule())
                                    }
                                }
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                            }
                        
                            }
                        }
                        
                        //
                        //用name當ID
                        List{
                            ForEach(items, id: \.name) { cats in
                                NavigationLink {
                                    ItemDetail(item: cats
                                    )
                                }label: {
                                    ItemRow(item: cats)
                                        .listRowSeparator(.hidden)
                                }
                            }
                            .listRowInsets(EdgeInsets())
                        }
                        .background(Color(red: 248/255, green: 232/255, blue: 209/255))
                        .listStyle(.plain)
//                        .frame(width: 300,height: 650)
                        .onAppear{
                            fetcher.fetchData(searchTerm: "max_weight", searchNum: "4")
                        }
                    }
                }
                
            }
            .tabItem{
                Label("圖鑑", systemImage: "music.house.fill")
            }
            SaveItemList()
                .tabItem{
                    Label("收藏", systemImage: "heart")
                }
        }.environmentObject(saver)
            .font(.custom("jf-openhuninn-1.1", size: 20))
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

