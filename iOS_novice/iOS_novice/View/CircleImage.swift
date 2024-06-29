//
//  CircleImage.swift
//  iOS_novice
//
//  Created on 2024/06/07.
//

import SwiftUI

struct CircleImage: View {
    var image:Image
    var body: some View {
        image
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
    CircleImage(image: Image("turtleRock"))
}
