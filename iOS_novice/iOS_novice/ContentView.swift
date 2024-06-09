//
//  ContentView.swift
//  iOS_novice
//
//  Created by Takumi Jindo on 2024/06/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text(
                "Turtle Rock"
            )
            .font(.title)
            HStack{
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer()
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
