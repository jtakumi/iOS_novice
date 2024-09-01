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
            //トグルスイッチをボタンとして使う
            isSet.toggle()
            } label:{
                // true の場合は星のアイコンを表示する
                Label("Toggle Favorite",systemImage: isSet ? "star.fill":"star")
                //アイコンのみを表示する
                    .labelStyle(.iconOnly)
                    .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
