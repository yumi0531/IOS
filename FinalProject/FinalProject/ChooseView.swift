//
//  ChooseView.swift
//  FinalProject
//
//  Created by yumi on 2022/12/21.
//

import SwiftUI
import FBSDKLoginKit

struct ChooseView: View {
    @Binding var isLogin:Bool
    @Binding var username : String
    @State var showCatPage = false
    @State var showDogPage = false
    var body: some View {
        ZStack{
            Image("BG3")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
                .ignoresSafeArea()
            Text("想查狗狗還是貓咪？")
                .offset(y:-250)
                .font(.custom("jf-openhuninn-1.1", size: 30))
            Text("Hello, " + username + "!")
                .offset(y:-285)
                .font(.custom("jf-openhuninn-1.1", size: 25))
            VStack{
                Button{
                    let manager = LoginManager()
                    manager.logOut()
                    isLogin = false
                }label: {
                    Text("登出")
                        .frame(width: 150, height: 50)
                        .background(Color(red:252/255,green:244/255,blue:241/255))
                        .foregroundColor(Color.black)
                        .clipShape(Capsule())
                        .font(.custom("jf-openhuninn-1.1", size: 25))
                }
                .offset(y:200)
                HStack(spacing: 50){
                    //狗狗button
                    Button{
                        showDogPage = true
                    }label: {
                        Image("Dog_icon")
                            .resizable()
                            .scaledToFit()
                            .background(Color.yellow)
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    .offset(y:250)
                    //貓貓button
                    Button{
                        showCatPage = true
                    }label: {
                        Image("Cat_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .clipShape(Circle())
                    }
                    .offset(y:250)
                }
            }
        }
        
        .fullScreenCover(isPresented: $showCatPage){
            ContentView(showCatPage: $showCatPage)
                .environmentObject(DataFetcher())
        }
        .fullScreenCover(isPresented: $showDogPage){
            dogContentView(showDogPage: $showDogPage)
            .environmentObject(DataFetcher())}
    }
}

//struct ChooseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChooseView()
//    }
//}
