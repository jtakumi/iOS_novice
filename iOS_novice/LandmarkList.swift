//
//  LandmarkList.swift
//  iOS_novice
//
//  Created by Takumi Jindo on 2024/06/29.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

#Preview {
    LandmarkList()
}
