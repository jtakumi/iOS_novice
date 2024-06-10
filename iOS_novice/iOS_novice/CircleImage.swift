//
//  CircleImage.swift
//  iOS_novice
//
//  Created by Takumi Jindo on 2024/06/07.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("theTree")
            .resizable()
            .aspectRatio(contentMode:.fit)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white,lineWidth: 4)
            }
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircleImage()
}
