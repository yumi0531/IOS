//
//  SaveItemList.swift
//  FinalProject
//
//  Created by yumi on 2022/12/22.
//

import SwiftUI

struct SaveItemList: View {
    @EnvironmentObject var saver: DataSaver
    var body: some View {
        ZStack {
            Color(red: 248/255, green: 232/255, blue: 209/255)
                .ignoresSafeArea()
            List {
                ForEach(saver.items) { item in
                    ItemRow(item: item, showSaveIcon: false)
                }
                .onDelete { indexSet in
                    saver.items.remove(atOffsets: indexSet)//左滑刪除
                }
                ForEach(saver.dogItems) { dogitem in
                    dogItemRow(item: dogitem, showSaveIcon: false)
                }
                .onDelete { indexSet in
                    saver.items.remove(atOffsets: indexSet)//左滑刪除
                }
            }
        }
    }
}

//struct SaveItemList_Previews: PreviewProvider {
//    static var previews: some View {
//        SaveItemList()
//    }
//}
