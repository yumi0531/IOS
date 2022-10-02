//
//  ContentView.swift
//  AppFrontCover
//
//  Created by yumi on 2022/10/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            /*---MUJI---*/
            HStack{
                /*----選單---*/
                VStack{
                    Image(systemName: "line.3.horizontal")
                        .resizable()
                        .frame(width: 30, height: 20 )
                    Text("選單")
                        .font(.system(size: 15))
                }.frame(width: 50, height: 20)
                    .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
                
                /*---------*/
                Text("from MUJI")
                    .bold()
                    .font(.system(size: 24))
                    .position(x: 130, y: 20)
                    .frame(width: 300, height: 50)
            }.position(x: 45, y: 20)
                .frame(width: 100, height: 35)
            /*----------*/
            /*---menu bar top---*/
            HStack(spacing: 0){
                
                ZStack(alignment: .bottomTrailing){
                    menuViewRed(titleName: "全部")
                    Rectangle()
                        .fill(Color(red: 122/255, green: 22/255, blue: 29/255))
                        .frame(width: 110, height: 3)
                        .offset(x: -5)
                    
                    
                }
                menuView(titleName: "品牌新訊")
                menuView(titleName: "門市消息")
                menuView(titleName: "活動")
            }
            /*------------*/
            
            /*--------------------圖片-----------------------*/
            VStack(spacing: 15) {
                HStack {
                    /*左上*/
                    ZStack(alignment: .top){
                        RecView()
                        ImgView(Img:"Img1")
                        ImgTitleView(ImgTitle:"MUJI passport")
                        ImgContentView(ConText: "【重要公告】2022年5月\n  12日起MUJI passport...")
                        ImgTitleView(ImgTitle:"09-01")
                            .offset(x:-31, y:65)
                        Image(systemName: "suit.heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .offset(x: 45, y: 280)
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                        
                        Text("687")
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                            .offset(x: 75, y: 280)
                    }
                    /*右上*/
                    ZStack(alignment: .top){
                        RecView()
                        HStack {
                            Rectangle()
                                .overlay(
                                    Image("Img3")
                                        .resizable()
                                        .scaledToFill()
                                )
                                .clipped()
                            
                        }
                        .frame(width: 190, height: 192)
                        
                        //                        ImgView(Img:"Img3")
                        //                            .frame(width: 10, height: 10)
                        ImgTitleView(ImgTitle:"李奧納多·皮卡丘")
                        ImgContentView(ConText: "【我家寶貝】新生活-點綴\n每個平凡的日常")
                        ImgTitleView(ImgTitle:"09-22")
                            .offset(x:-31, y:65)
                        Image(systemName: "suit.heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .offset(x: 45, y: 280)
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                        
                        Text("520")
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                            .offset(x: 75, y: 280)
                    }
                }
                HStack {
                    /*左下*/
                    ZStack(alignment: .top){
                        RecView()
                        ImgView(Img:"Img2")
                        ImgTitleView(ImgTitle:"品牌新訊")
                            .offset(x: -25)
                        ImgContentView(ConText: "9/15起，停止免費提供購\n物提袋")
                        ImgTitleView(ImgTitle:"09-01")
                            .offset(x:-31, y:65)
                        Image(systemName: "suit.heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .offset(x: 45, y: 280)
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                        
                        Text("307")
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                            .offset(x: 75, y: 280)
                    }
                    ZStack(alignment: .top){
                        RecView()
                        HStack {
                            Rectangle()
                                .overlay(
                                    Image("Img4")
                                        .resizable()
                                        .scaledToFill()
                                )
                                .clipped()
                            
                        }
                        .frame(width: 190, height: 192)
                        ImgTitleView(ImgTitle:"服飾造型顧問的穿搭圖輯")
                            .offset(x: 24)
                        ImgContentView(ConText: "【秋日穿搭】以經典的橫\n紋Ｔ恤增添秋季範圍")
                        ImgTitleView(ImgTitle:"09-28")
                            .offset(x:-31, y:65)
                        Image(systemName: "suit.heart")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .offset(x: 45, y: 280)
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                        
                        Text("8")
                            .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                            .offset(x: 70, y: 280)
                    }
                }
                
                
            }
            /*---menu bar bottom---*/
            HStack(spacing: 0){
                
                ZStack(){
                    Rectangle()
                        .fill(.white)
                        .frame(width: 90, height: 75)
                    Image(systemName: "house.fill")
                        .resizable()
                        .scaledToFit()
                        .offset( y: -5)
                        .frame(width: 30, height: 35)
                        .foregroundColor(Color(red: 122/255, green: 22/255, blue: 29/255))
                    Text("from MUJI")
                        .offset(x:7, y:25)
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 122/255, green: 22/255, blue: 29/255))
                }
                ZStack(){
                    Rectangle()
                        .fill(.white)
                        .frame(width: 90, height: 75)
                    
                    Image(systemName: "bag")
                        .resizable()
                        .scaledToFit()
                        .offset( y: -5)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255))
                    Text("官網")
                        .offset(y:25)
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 130/255, green: 130/255, blue: 130/255))
                    
                }
                ZStack(){
                    Rectangle()
                        .fill(.white)
                        .frame(width: 90, height: 75)
                    
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .scaledToFit()
                        .offset( y: -5)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                    Text("搜尋")
                        .offset(y:25)
                        .font(.system(size: 13))
                    .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))                }
                
                ZStack(){
                    Rectangle()
                        .fill(.white)
                        .frame(width: 90, height: 75)
                    
                    Image(systemName: "suit.heart")
                        .resizable()
                        .scaledToFit()
                        .offset( y: -5)
                        .frame(width: 30, height: 35)
                        .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                    Text("收藏夾")
                        .offset(y:25)
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                }
                ZStack(){
                    Rectangle()
                        .fill(.white)
                        .frame(width: 90, height: 75)
                    
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .scaledToFit()
                        .offset( y: -5)
                        .frame(width: 30, height: 35)
                        .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                    Text("會員證")
                        .offset(y:25)
                        .font(.system(size: 13))
                        .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
                }
                
            }
            /*------------*/
        }
    }
    /*--------------------圖片-----------------------*/
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct menuViewRed: View {
    let titleName:String
    var body: some View {
        Text(titleName)
            .frame(width: 105, height: 60)
            .foregroundColor(Color(red: 122/255, green: 22/255, blue: 29/255))
            .background(Color(red: 242/255, green: 242/255, blue: 242/255))
    }
}

struct menuView: View {
    let titleName:String
    var body: some View {
        Text(titleName)
            .frame(width: 110, height: 60)
            .foregroundColor(Color(red: 91/255, green: 91/255, blue: 91/255))
            .background(Color(red: 242/255, green: 242/255, blue: 242/255))
        
    }
}

struct RecView: View {
    var body: some View {
        Rectangle()
            .fill(.white)
            .frame(width: 190, height: 310)
            .shadow(color: .gray,  radius: 2, x: 2, y: 2)
    }
}

struct ImgView: View {
    let Img:String
    var body: some View {
        Image(Img)
            .resizable()
            .scaledToFill()
            .frame(width: 190, height: 100)
            .offset(y: 45)
    }
}

struct ImgTitleView: View {
    let ImgTitle:String
    var body: some View {
        Text(ImgTitle)
            .font(.system(size: 13))
            .offset(x: -35, y: 200)
        .foregroundColor(Color(red: 135/255, green: 135/255, blue: 135/255))
    }
}

struct ImgContentView: View {
    let ConText:String
    var body: some View {
        Text(ConText)
            .font(.system(size: 15))
            .offset(x:-5, y: 205)
            .frame(width: 200, height: 70)
    }
}
