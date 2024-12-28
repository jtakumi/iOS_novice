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
                })
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
