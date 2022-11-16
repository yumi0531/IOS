//
//  mapCons.swift
//  HW3
//
//  Created by yumi on 2022/11/16.
//

import Foundation
import CoreLocation

struct IdentifiablePlace: Identifiable {
    let id = UUID()
    let location: CLLocationCoordinate2D
    let name: String
    
    init(lat: Double, long: Double, name: String) {
        location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
        self.name = name 
    }
}
