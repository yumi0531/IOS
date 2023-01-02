//
//  DogItemDetail.swift
//  FinalProject
//
//  Created by yumi on 2023/1/2.
//

import SwiftUI

struct DogItemDetail: View {
    @EnvironmentObject var saver: DataSaver
    let item : DogStoreItem
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
                    Text("狗狗品種 : " + item.name)
                    Text("護衛度 : " + String(item.protectiveness!))
                    Text("可訓練程度 : " + String(item.trainability!))
                    Text("年齡 : "+String(item.max_life_expectancy!) + " years")
                    Text("體重(公) : "+String(item.min_weight_male!) + " pounds")
                    Text("體重(母) : "+String(item.min_weight_female!) + " pounds")
                    HStack{
                        Text("狗狗友善度 : ")
                        ForEach(0..<(item.good_with_other_dogs ?? 0)){ item in
                            Image(systemName: "star.fill")
                        }
                        ForEach(0..<(5 - (item.good_with_other_dogs ?? 5))){item in
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

//struct DogItemDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        DogItemDetail()
//    }
//}
