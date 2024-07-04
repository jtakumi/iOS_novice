//
//  iOS_noviceApp.swift
//  iOS_novice
//
//  Created  on 2024/06/07.
//

import SwiftUI

@main
struct iOS_noviceApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
