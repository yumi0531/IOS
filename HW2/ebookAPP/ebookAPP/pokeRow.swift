//
//  pokeRow.swift
//  ebookAPP
//
//  Created by yumi on 2022/10/20.
//

import SwiftUI
struct pokeRow: View {
    let poke:Poke//傳入自訂義資料型別
    var body: some View {
        HStack {
            Image(poke.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 80)
                .clipped()
            HStack() {
                Text(poke.name)
                Text(poke.Area)
                Text(poke.Attribute)
                    
            }
            Spacer()

        }
        
    }
}

struct pokeRow_Previews: PreviewProvider {
    static var previews: some View {
        pokeRow(poke: .demoPoke)
            .previewLayout(.sizeThatFits)
    }
}
