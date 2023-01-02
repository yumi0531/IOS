//
//  DataFetcher.swift
//  FinalProject
//
//  Created by yumi on 2022/12/14.
//

import SwiftUI

class DataFetcher: ObservableObject {
    //類似全域
    @Published var items = [StoreItem]()
    @Published var dogItems = [DogStoreItem]()
    enum FetchError: Error {
            case invalidURL
            case badRequest
        }
    //定義 function fetchItems & 宣告property items
    //fetch catApi
    func fetchData(searchTerm:String,searchNum:String) {
//        let name = "abyssinian".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //直接從這邊改搜尋
        let url = URL(string: "https://api.api-ninjas.com/v1/cats?\(searchTerm)=\(searchNum)")!
        var request = URLRequest(url: url)
        //my API key
        request.setValue("cceLcd23pzowby9UPtAHyA==R2etFeSJn46rltKC", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            //        guard let data = data else { return }
            
            if let data{
                let decoder = JSONDecoder()
                do{
                    //最外層為array
                    let searchResponse = try decoder.decode([StoreItem].self, from: data)
                    print(String(data: data, encoding: .utf8)!)
                    print(searchResponse.count)
                    //顯示在螢幕要在main thread跑
                    DispatchQueue.main.async {
                        self.items = searchResponse
                    }
                }catch{
                    print(error)
                }
            }else if let error{
                print(error)
            }
        }
        task.resume()
    }
    
    //fetch dogApi
    func fetchDogData(searchTerm:String,searchNum:String) {
//        let name = "abyssinian".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        //直接從這邊改搜尋
        let url = URL(string: "https://api.api-ninjas.com/v1/dogs?\(searchTerm)=\(searchNum)")!
        var request = URLRequest(url: url)
        //my API key
        request.setValue("cceLcd23pzowby9UPtAHyA==R2etFeSJn46rltKC", forHTTPHeaderField: "X-Api-Key")
        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            //        guard let data = data else { return }
            
            if let data{
                let decoder = JSONDecoder()
                do{
                    //最外層為array
                    let searchResponse = try decoder.decode([DogStoreItem].self, from: data)
                    print(String(data: data, encoding: .utf8)!)
                    print(searchResponse.count)
                    //顯示在螢幕要在main thread跑
                    DispatchQueue.main.async {
                        self.dogItems = searchResponse
                    }
                }catch{
                    print(error)
                }
            }else if let error{
                print(error)
            }
        }
        task.resume()
    }
}

//struct DataFetcher_Previews: PreviewProvider {
//    static var previews: some View {
//        DataFetcher()
//    }
//}
