//
//  MapView.swift
//  iOS_novice
//
//  Created on 2024/06/09.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    var body: some View {
        //MapKit を使用してマップを表示する
        Map(position: .constant(.region(region)))
    }

private var region:MKCoordinateRegion{
    //マップの中心地を決定する
    MKCoordinateRegion(
        center: coordinate,
        //(latutude, longitude) で座標を決定する
        span:MKCoordinateSpan(latitudeDelta:  0.2, longitudeDelta:0.2)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
}
