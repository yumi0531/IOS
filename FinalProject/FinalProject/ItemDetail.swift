//
//  ItemDetail.swift
//  FinalProject
//
//  Created by yumi on 2022/12/14.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var saver: DataSaver
//    @StateObject private var saver = DataSaver()
    let item : StoreItem
    var body: some View {
        let photo = AsyncImage(url: URL(string: item.image_link)) { phase in
            switch phase {
            case .empty:
                Image("cat_loading_img")
                    .resizable()
                    .opacity(0.5)
            case .success(let image):
                image
                    .resizable()
            case .failure(_):
                Image("cat_bye_img")
                    .resizable()
                    .opacity(0.5)
            @unknown default:
                Image("cat_bye_img")
                    .resizable()
                    .opacity(0.5)
            }
        }
        ZStack{
            Image("BG2")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .ignoresSafeArea()
            VStack{
                AsyncImage(url: URL(string: item.image_link)) { phase in
                    switch phase {
                    case .empty:
                        Image("cat_loading_img")
                            .resizable()
                            .opacity(0.1)
                    case .success(let image):
                        image
                            .resizable()
                            .transition(.slide)
                    case .failure(_):
                        Image("cat_bye_img")
                            .resizable()
                            .opacity(0.1)
                    @unknown default:
                        Image("cat_bye_img")
                            .resizable()
                            .opacity(0.1)
                    }
                }
                .cornerRadius(40)
                .scaledToFill()
                .frame(width: 250, height: 250)
                .offset(y:-100)
                VStack(alignment: .leading,spacing: 20){
                    Text("貓貓品種 : " + item.name)
                    Text("出生地 : " + item.origin!)
                    Text("最大體重 : " + String(item.max_weight!))
                    Text("貓貓智商 : " + String(item.intelligence!))
                    HStack{
                        Text("家庭友善度 : ")
                        ForEach(0..<(item.family_friendly ?? 0)){ item in
                            Image(systemName: "star.fill")
                        }
                        ForEach(0..<(5 - (item.family_friendly ?? 0))){item in
                            Image(systemName: "star")
                        }
                    }
                    HStack{
                        Text("與家中其他寵物友善度 : ")
                        ForEach(0..<(item.other_pets_friendly ?? 0)){ item in
                            Image(systemName: "star.fill")
                        }
                        ForEach(0..<(5 - (item.other_pets_friendly ?? 5))){item in
                            Image(systemName: "star")
                        }
                    }
                }
                .offset(y:-70)
                VStack{
                    Text("快把我分享出去！！")
                    ShareLink(item: item.name,preview:SharePreview(item.name,image: item.image_link))
                }.offset(x:70,y:20)
            }
        }
        .font(.custom("jf-openhuninn-1.1", size: 20))
    }

}

//struct ItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemDetail()
//    }
//}
