//
//  shinny.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/20.
//

import SwiftUI

struct shinny: View {
    let plus = ["噴火龍","水箭龜","妙蛙花"]
    var body: some View {
        TabView{
            VStack{
                Text("一般型態")
                Image("噴火龍")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                    .tabItem{
                        Text("一般")
                    }
            }
            
            VStack{
                Text("色違型態")
                Image("噴火龍色違")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 400)
                    .tabItem{
                        Text("色違")
                    }
            }
            
        }.tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
}

struct shinny_Previews: PreviewProvider {
    static var previews: some View {
        shinny()
    }
}
