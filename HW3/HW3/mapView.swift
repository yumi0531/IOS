//
//  mapView.swift
//  HW3
//
//  Created by yumi on 2022/11/16.
//

import SwiftUI
import MapKit

struct mapView: View {
    @Binding var showMap:Bool
    //region(區域) 控制地圖中心點的經緯度和範圍，它的型別為 MKCoordinateRegion
    /*
     center: 型別 CLLocationCoordinate2D，代表地圖中心點的經緯度座標。latitude 是緯度，longitude 是經度。
     latitudinalMeters: 緯度範圍，單位是公尺，因此我們傳入 1000 表示地圖的最北邊 & 最南邊距離 1000 公尺
     longitudinalMeters: 經度範圍，單位是公尺，因此我們傳入 1000 表示地圖的最東邊 & 最西邊距離 1000 公尺。
     */
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.1507, longitude: 121.77618), latitudinalMeters: 1000, longitudinalMeters: 1000)
    let items = [
        IdentifiablePlace(lat: 25.1507, long: 121.77618,name: "海洋大學")
    ]
    var body: some View {
        
        VStack{
            Button{
                showMap = false
            }label: {
                Text("回上頁")
                    .padding()
                    .background(Color(red: 205/255, green: 155/255, blue: 155/255))
                    .foregroundColor(.white)
            }
            Map(coordinateRegion: $region,annotationItems: items) { item in
                MapAnnotation(coordinate: item.location) {
                    VStack {
                        Text(item.name)
                        Image("eeveCute")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 70)
                    }
                    
                }
            }
        }
    }
}
struct mapView_Previews: PreviewProvider {
    static var previews: some View {
        mapView(showMap: .constant(true))
    }
}
