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
        //画面に合わせて大きさを変える
        image
            .resizable()
            .aspectRatio(contentMode:.fit)
        //画像を丸くくり抜く
            .clipShape(Circle())
            .overlay{
                //輪郭線の描写
                Circle().stroke(.white,lineWidth: 4)
            }
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CircleImage(image: Image("turtleRock"))
}
