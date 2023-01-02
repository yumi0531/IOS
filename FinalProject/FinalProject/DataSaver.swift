//
//  DataSaver.swift
//  FinalProject
//
//  Created by yumi on 2022/12/22.
//

import SwiftUI

class DataSaver: ObservableObject {
    @AppStorage("items") var itemsData: Data?
    @Published var items = [StoreItem]() {
        didSet {
            let encoder = JSONEncoder()
            do {
                itemsData = try encoder.encode(items)
            } catch {
                print(error)
            }
        }
    }
    @AppStorage("dogItems") var DogitemsData: Data?
    @Published var dogItems = [DogStoreItem](){
        didSet {
            let encoder = JSONEncoder()
            do {
                DogitemsData = try encoder.encode(dogItems)
            } catch {
                print(error)
            }
        }

    }
    init() {
        if let itemsData {
            let decoder = JSONDecoder()
            do {
                items = try decoder.decode([StoreItem].self, from: itemsData)
            } catch  {
                print(error)
            }
           
        }
        if let DogitemsData{
            let decoder = JSONDecoder()
            do {
                dogItems = try decoder.decode([DogStoreItem].self, from: DogitemsData)
            } catch  {
                print(error)
            }
        }
    }
}

//struct DataSaver_Previews: PreviewProvider {
//    static var previews: some View {
//        DataSaver()
//    }
//}
