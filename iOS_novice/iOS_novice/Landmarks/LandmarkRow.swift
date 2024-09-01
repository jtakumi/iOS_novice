//
//  LandmarkRow.swift
//  iOS_novice
//
//  リストのセルを描写するコード
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack{
            landmark.image
            //画像を 50 x 50 で左端に表示
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            //Spacer を挿入することでお気に入りアイコンを右端に寄せている
            Spacer()
            if( landmark.isFavorite) {
                //お気に入り登録している時だけ星アイコンを黄色で表示する
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

#Preview("Turtle Rock") {
    let landmarks = ModelData().landmarks
    return LandmarkRow(landmark: landmarks[0])
}

#Preview("Salmon") {
    let landmarks = ModelData().landmarks
    return LandmarkRow(landmark: landmarks[1])
}

#Preview("Group") {
    let landmarks = ModelData().landmarks
    return Group{
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])

    }
   }
