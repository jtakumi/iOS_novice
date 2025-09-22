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
                    .onTapGesture(count:1,perform: {
                        UserFavOutput(landmarkId: landmark.id, isFavorite: landmark.isFavorite)
                                      })
                    
                    //お気に入りアイコンがタップされたらお気に入りとして登録する
                    FavoriteButton(landmark: $modelData.landmarks[landmarkIndex])
                        .onTapGesture(count:1,perform: {
                        UserFavOutput(landmarkId: landmark.id, isFavorite: landmark.isFavorite)
                    })
                    
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
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("About \(landmark.name)")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(landmark.description)
                        .font(.body)
                        .lineSpacing(4)
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(.regularMaterial)
                        .overlay {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color.purple.opacity(0.1))
                        }
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                }
                .clipShape(RoundedRectangle(cornerRadius: 16))
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
