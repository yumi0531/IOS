//
//  login.swift
//  HW3
//
//  Created by yumi on 2022/11/13.
//

import SwiftUI

struct login: View {
    @State private var name = "我"
    @State private var birthday = Date()
    @State private var happy :Float = 0.0
    @State private var selectedIndex = 0
    @State private var Eeve_name = "伊布"
    @State private var EeveIndex :Int = 0
    @State private var showPage = false
    let star = ["牡羊座", "金牛座", "雙子座", "巨蟹座","獅子座","處女座","天秤座","天蠍座","射手座","摩羯座","水瓶座","雙魚座"]
    let Eeve = ["火伊布","水伊布","雷伊布","葉伊布","冰伊布","太陽伊布","月亮伊布","仙子伊布"]
    var body: some View {
        ZStack {
            Image("background_img")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .ignoresSafeArea()
            VStack(spacing: 20){
                VStack{
                    Text("最適合"+name+"的伊布")
                        .font(.title)
                    
                    Button{
                        if(selectedIndex == 0){
                            EeveIndex = (0 + (Int(happy) % 7))
                            
                        }else if(selectedIndex == 1){
                            EeveIndex = (3 + (Int(happy) % 7))
                        }else if(selectedIndex == 2){
                            EeveIndex = (1+(Int(happy) % 7))
                        }else if(selectedIndex == 3){
                            EeveIndex = (4+(Int(happy) % 7))
                        }else if(selectedIndex == 4){
                            EeveIndex = (0+(Int(happy) % 7))
                        }else if(selectedIndex == 5){
                            EeveIndex = (2+(Int(happy) % 7))
                        }else if(selectedIndex == 6){
                            EeveIndex = (4+(Int(happy) % 7))
                        }else if(selectedIndex == 7){
                            EeveIndex = (3+(Int(happy) % 7))
                        }else if(selectedIndex == 8){
                            EeveIndex = (2+(Int(happy) % 7))
                        }else if(selectedIndex == 9){
                            EeveIndex = (4+(Int(happy) % 7))
                        }else if(selectedIndex == 10){
                            EeveIndex = (1+(Int(happy) % 7))
                        }else if(selectedIndex == 11){
                            EeveIndex = (1+(Int(happy) % 7))
                        }
                        
                        Eeve_name = Eeve[EeveIndex]
                    }label: {
                        Image(Eeve_name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200,height: 200)
                    }
                    
                    Button{
                        EeveIndex = Int.random(in: 0...7)

                        Eeve_name = Eeve[EeveIndex]
                    }label: {
                        Text("我想換一種伊布")
                            .fontWeight(.bold)
                            .padding()
                            .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                            .cornerRadius(40)
                            .foregroundColor(.white)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 40)
                                    .stroke(Color(red: 205/255, green: 155/255, blue: 155/255), lineWidth: 3)
                            )
                    }
                }
                HStack{ //name
                    Text("我叫")
                    TextField("你的名字", text: $name,prompt: Text("你的名字"))
                        .textFieldStyle(.roundedBorder
                        )
                }
                HStack{//birthday
                    DatePicker("我的生日是 " + birthday.formatted(.dateTime.year().month().day()),selection: $birthday,displayedComponents: .date)
                }
                HStack{
                    Text("我的個性 樂觀")
                    Slider(value: $happy,in: 0...3)
                    Text("悲觀")
                }
                HStack{//star
                    Text("我的星座 ")
                    Picker(selection: $selectedIndex){
                        ForEach (0..<12){item in
                            Text(star[item]).tag(item)
                        }
                    }label: {
                        Text("星座")
                    }
                    Spacer()
                }
                Button{
                    showPage = true
                }label: {
                    Text("開始飼養")
                        .padding()
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                    
                }.sheet(isPresented: $showPage, content: {
                    ContentView(EeveIndex: $EeveIndex)
                })
                
                
                
                
            }
        }.font(.custom("jf-openhuninn-1.1", size: 20))
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
