//
//  other1.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/20.
//

import SwiftUI

struct other1: View {
    let pokemons = ["大劍鬼","火爆獸","卡蒂狗","霹靂電球","勇士雄鷹","索羅亞","頑皮雷彈","風速狗","黏美兒"
    ]
    let eggs = ["2公里蛋","5公里蛋","10公里蛋"]
    
    var body: some View {
        let columns = Array(repeating: GridItem(), count: 2)
        
        VStack{
            //橫的
            VStack {
                ScrollView(.horizontal){
                    let rows = [GridItem()]
                    LazyHGrid(rows: rows){
                        ForEach(eggs.indices,id: \.self){
                            item in
                            eggView(poke: eggs[item], number: item+1)
                        }
                    }
                    
                    
                }
            }.fixedSize(horizontal: false, vertical: true)
            Spacer()
            //直的
            ScrollView(.vertical){
                LazyVGrid(columns: columns){
                    ForEach(pokemons.indices,id: \.self){
                        item in
                        pokeView(poke: pokemons[item], number: item+1)
                        
                    }
                }
            }
        }
    }
}
struct other1_Previews: PreviewProvider {
    static var previews: some View {
        other1()
    }
}
struct eggView:View{
    let poke:String
    let number:Int
    var body: some View{
        VStack{
            ZStack{
                Image(poke)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150,height: 150)
            }
            Text(poke)
        }
        .overlay(alignment:.topLeading,content: {
            NumberImage(number:number)
        })
        
    }
}

struct pokeView:View{
    let poke:String
    let number:Int
    var body: some View{
        VStack{
            ZStack{
                Image("big_pokemon_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150)
                Image(poke)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150,height: 150)
            }
            Text(poke)
        }
        .overlay(alignment:.topLeading,content: {
            NumberImage(number:number)
        })
        
    }
}
struct NumberImage:View{
    let number:Int
    var body: some View{
        Image(systemName:"\(number).circle.fill")
            .font(.largeTitle)
            .foregroundColor(.white)
    }
}
