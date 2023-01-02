//
//  ItemRow.swift
//  FinalProject
//
//  Created by yumi on 2022/12/11.
//
//定義 ItemRow
import SwiftUI

struct ItemRow: View {
    let item : StoreItem
    @State private var showDetailPage = false
    @EnvironmentObject var saver: DataSaver
    var showSaveIcon = true
    var isSave: Bool {
        item.isSave ?? false
    }
    var body: some View {
        VStack(){
            AsyncImage(url: URL(string: item.image_link)) { phase in
                switch phase {
                case .empty:
                    Image("cat_loading_img")
                        .resizable()
                        .opacity(0.1)
                case .success(let image):
                    image
                        .resizable()
                case .failure(_):
                    Image("cat_bye_img")
                        .resizable()
                        .opacity(0.1)
                @unknown default:
                    Image("cat_bye_img")
                        .resizable()
                        .opacity(0.1)
                }
            }
            .scaledToFill()
            .frame(height: 200)
            .clipped()
            .padding()
            HStack{
                Text(item.name)
                    
                if showSaveIcon {
                    Image(systemName: "heart")
                        .symbolVariant(isSave ? .fill : .none)
                        .onTapGesture {
                            if isSave == false {
                                saver.items.append(item)

                            } else {

                                saver.items.removeAll {
                                    $0.name == item.name
                                }
                            }
                        }
                }
            }
            .padding(.bottom, 10)
        }
        .font(.custom("jf-openhuninn-1.1", size: 20))
        .background(Color(red: 231/255, green: 202/255, blue: 168/255))
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

//struct ItemRow_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemRow()
//    }
//}
