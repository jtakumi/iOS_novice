//
//  FavoriteButton.swift
//  iOS_novice
//
//  Created by Takumi Jindo on 2024/07/04.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet:Bool
    var body: some View {
        Button{
            isSet.toggle()
            } label:{
                Label("Toggle Favorite",systemImage: isSet ? "star.fill":"star")
                    .labelStyle(.iconOnly)
                    .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
