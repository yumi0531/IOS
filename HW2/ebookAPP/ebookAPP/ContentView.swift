//
//  ContentView.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/16.
//

import SwiftUI
import AVKit
import AVFoundation //Video

struct ContentView: View {
    let player = AVPlayer()
    let pokeIcon = ["小火龍", "烈焰馬"]
    @State private var rotateDegree: Double = 0
    var body: some View {
        NavigationStack {
            ZStack{
                ZStack{
                    Image("bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.width, height: .infinity)
                    
                    Image("poke")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .offset(y:-150)
                }.offset(y:100)
                Link(destination: URL(string: "https://pokemongolive.com/zh_Hant/seasons/light")!, label: {
                    ZStack{
                        Image("title")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height:150)
                        Text("light season")
                            .offset(y:-40)
                    }.offset(y:-130)
                })
                //second background
                Text("影片")
                    .padding()
                    .background(Color.blue)
                    .frame(width: 400, height: 250)
                    .background(LinearGradient(gradient: Gradient(colors: [Color(red: 71/255, green: 38/255, blue: 108/255), Color.black]), startPoint: .top, endPoint: .bottom))
                    .offset(y:500)
                ZStack{
                    let url = Bundle.main.url(forResource: "pokeVideo", withExtension: "mov")!
                    VideoPlayer(player: AVPlayer(url: url))
                        .frame(width: 300, height: 190)
                        .offset(y:470)
                    //我想在這邊新增一個橫的scrollview, 點擊裡面的圖片可以跳轉到別的頁面
                }
                Image("科斯莫谷")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 500)
                    .rotationEffect(.degrees(rotateDegree))
                    .animation(
                        .linear(duration: 30)
                        .repeatForever(autoreverses: false),
                        value: rotateDegree
                    )
                    .onAppear {
                        rotateDegree = 360}
                    .offset(x:70,y:150)
                HStack{
                    ScrollView(.horizontal){
                        NavigationLink {
                            pokeList()
                        } label: {
                            IconView(name: "小火龍")
                        }
                        NavigationLink {
                            pokeList2()
                        } label: {
                            IconView(name: "烈焰馬")
                        }
                        NavigationLink {
                            pokeList()
                        } label: {
                            IconView(name: "六尾")
                        }
                    }
                    
                }.offset(y:190)
                
            }.ignoresSafeArea()
                .offset(y:-190)
            
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct pokeOfView:View{
    let poke:String
    let number:Int
    var body: some View{
        VStack{
            Image(poke)
                .resizable()
                .scaledToFill()
                .frame(width: 150,height: 150)
            
            Text(poke)
        }
        .overlay(alignment:.topLeading,content: {
            NumberImage(number:number)
        })
        
    }
}
struct NumberOfImage:View{
    let number:Int
    var body: some View{
        Image(systemName:"\(number).circle.fill")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}

struct IconView: View {
    let name:String
    var body: some View {
        ZStack{
            Image("random_center_bg")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Image("pokemon_list_bg")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            Image(name)
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
        }
    }
}
