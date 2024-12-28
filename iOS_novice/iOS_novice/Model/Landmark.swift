//
//  Landmark.swift
//  iOS_novice
//
// 主に JSON からの情報を取得するコード
//

import Foundation
import SwiftUI
import CoreLocation
import SwiftData

struct Landmark:Hashable,Codable,Identifiable{
    // JSON から読み込む情報
    var id:Int
    var name:String
    var park:String
    var state:String //観光地がある州
    var description:String
    //SwiftData で管理
    var isFavorite:Bool = false //お気に入り登録しているかのデフォ値
    
    public var imageName:String
    var image:Image{
        //画像の名前から画像を取得
        Image(imageName)
    }
    
    private var coordinates:Coordinates
    var locationCoordinate:CLLocationCoordinate2D{
        //JSON ファイル内にあるcoordinates から latitude, longitude を読み出す
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable,Codable {
        var latitude:Double
        var longitude:Double
    }
}
