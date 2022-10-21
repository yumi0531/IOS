//
//  pokeList.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/19.
//

import SwiftUI

struct pokeList: View {
    //建立一個poke Array
    let pokemons = [Poke(name: "小火龍", Area: "洗翠", Attribute: "火"),Poke(name: "傑尼龜", Area: "洗翠", Attribute: "水"),Poke(name: "妙蛙種子", Area: "洗翠", Attribute: "草")]

    var body: some View {
        NavigationView{
            List{ForEach(pokemons){poke in
                NavigationLink{
                    shinny()
                }label: {
                    pokeRow(poke: poke)
                }
            }
                NavigationLink{
                    other1()
                }label: {
                    Text("其他洗翠小夥伴")
                }
            }
        }.navigationTitle("洗翠的樣子")
    }
}

struct pokeList_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            pokeList()
        }
    }
}
