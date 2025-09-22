//
//  LandmarkList.swift
//  iOS_novice
//
//  Created on 2024/06/29.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    // 初期状態ではお気に入り登録していない観光地も表示する
    @State private var showFavoritesOnly = false
    
    @State private var searchWord:String = ""
    
    var filteredLandmarks:[Landmark] {
        modelData.landmarks.filter{
            landmark in
            (!showFavoritesOnly ||  landmark.isFavorite)
        }
    }
    
    var body: some View {
        //リストの上にあるトグルスイッチとタイトルを表示する
        NavigationSplitView{
            List{
                //Toggle スイッチのコンポーネント
                //Toggle スイッチをオンにするとお気に入り観光地だけ表示する
                Toggle(isOn: $showFavoritesOnly, label: {
                        Text("Favorite Landmarks only display")
                            .font(.headline)
                })
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.regularMaterial)
                        .overlay {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.green.opacity(0.1))
                        }
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: 4)
                }
                .clipShape(RoundedRectangle(cornerRadius: 12))
               ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        //セルをタップすると詳細画面に移行する
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        //セルにリンクをセットする
                        LandmarkRow(landmark: landmark)
                    }
                }
        }
            //Toggle スイッチをタップした時のアニメーション
            .animation(.default,value: filteredLandmarks)
            //タイトルの表示
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
        .searchable(text: $searchWord,
                    placement:.sidebar,
                    prompt:"search landkmark name")
    }
}

#Preview {
    LandmarkList()
}
