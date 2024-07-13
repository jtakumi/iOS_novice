//
//  LandmarkList.swift
//  iOS_novice
//
//  Created by Takumi Jindo on 2024/06/29.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks:[Landmark] {
        modelData.landmarks.filter{
            landmark in
            (!showFavoritesOnly ||  landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List{
                Toggle(isOn: $showFavoritesOnly, label: {
                        Text("Favorite Landmarks only display")
                })
               ForEach(filteredLandmarks) { landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
        }
            .animation(.default,value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
