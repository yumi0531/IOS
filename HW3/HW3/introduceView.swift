//
//  introduceView.swift
//  HW3
//
//  Created by yumi on 2022/11/16.
//

import SwiftUI

struct introduceView: View {
    @Binding var introduceText :String
    @Binding var attribute :String
    @Binding var week :String
    @Binding var Classification:String
    var body: some View {
        ZStack {
            Image("background_img")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0,maxWidth: .infinity,minHeight: 0,maxHeight: .infinity)
            .ignoresSafeArea()
            VStack(alignment: .leading,spacing: 20){
                HStack{
                    Text("介紹：")
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                        .offset(y:-40)
                    Text(introduceText)
//                        .offset(y:90)
                    
                }
                HStack{
                    Text("分類：")
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                    Text(Classification)
                    
                }
                HStack{
                    Text("屬性：")
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                    Text(attribute)
                    
                }
                HStack{
                    Text("弱點：")
                        .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                        .foregroundColor(.white)
                    Text(week)
                    
                }
                
            }
        }.font(.custom("jf-openhuninn-1.1", size: 25))
    }
}

struct introduceView_Previews: PreviewProvider {
    static var previews: some View {
        introduceView(introduceText: .constant(""),attribute: .constant(""),week: .constant(""),Classification: .constant(""))
    }
}
