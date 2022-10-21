//
//  pokeList2.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/20.
//

import SwiftUI

struct pokeList2: View {
    //建立一個poke Array
    let pokemons = [Poke(name: "大蔥鴨", Area: "伽勒爾", Attribute: "格鬥"),Poke(name: "烈焰馬", Area: "伽勒爾", Attribute: "超能力"),Poke(name: "呆呆獸", Area: "伽勒爾", Attribute: "超能力")]
    var body: some View {
        NavigationView{
            List{ForEach(pokemons){poke in
                NavigationLink{
                    shinny()
                }label: {
                    pokeRow(poke: poke)
                }
            }
            }
        }.navigationTitle("伽勒爾的樣子")
    }

}

struct pokeList2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            pokeList2()
        }
    }
}
