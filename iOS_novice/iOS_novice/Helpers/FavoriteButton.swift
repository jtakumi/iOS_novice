//
//  FavoriteButton.swift
//  iOS_novice
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var landmark:Landmark
    @Environment(\.modelContext) var modelContext
    
    private func saveFavorite(){
        do{
            try modelContext.save()
            print("save favorite success")
        }catch{
            print("Error of saving favorite:\(error)")
        }
    }
    var body: some View {
        Button{
            //トグルスイッチをボタンとして使う
            landmark.isFavorite.toggle()
            
            saveFavorite()
            
            } label:{
                // true の場合は星のアイコンを表示する
                Label("Toggle Favorite",systemImage: landmark.isFavorite ? "star.fill":"star")
                //アイコンのみを表示する
                    .labelStyle(.iconOnly)
                    .foregroundStyle(landmark.isFavorite ? .yellow : .gray)
                    .font(.title2)
                    .padding(8)
        }
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.regularMaterial)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .fill((landmark.isFavorite ? Color.yellow : Color.gray).opacity(0.1))
                }
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
        }
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
