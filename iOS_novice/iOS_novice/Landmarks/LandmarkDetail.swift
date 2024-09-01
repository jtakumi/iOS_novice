//
//  LandmarkDetail.swift
//  iOS_novice
//
// 観光地の詳細画面を表示するコード

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark:Landmark
    var landmarkIndex:Int {
        modelData.landmarks.firstIndex(where: {$0.id == landmark.id})!
    }
    var body: some View {
        @Bindable var modelData = modelData
        ScrollView{
            // Map から観光地の説明までをスクロールできるようにする
            MapView(coordinate: landmark.locationCoordinate).frame(height:300)
            CircleImage(image: landmark.image)
                .offset(y:-130)
                .padding(.bottom,-130)
            VStack(alignment:.leading) {
                //観光地名とお気に入りアイコン
                HStack {
                    Text(
                        landmark.name
                    )
                    .font(.title)
                    //お気に入りアイコンがタップされたらお気に入りとして登録する
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
               
                HStack{
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer()
                    Text(landmark.state)
                        .font(.subheadline)
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)
                
                Divider()
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()

        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    LandmarkDetail(landmark: ModelData().landmarks[0])
}
