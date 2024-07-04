//
//  LandmarkList.swift
//  iOS_novice
//
//  Created by Takumi Jindo on 2024/06/29.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = true
    
    var filteredLandmarks:[Landmark] {
        landmarks.filter{
            landmark in
            (!showFavoritesOnly ||  landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationSplitView{
            List(filteredLandmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            
        }
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
