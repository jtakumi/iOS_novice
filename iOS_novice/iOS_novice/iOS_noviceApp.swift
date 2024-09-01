//
//  iOS_noviceApp.swift
//  iOS_novice
//
//  Created  on 2024/06/07.
//

import SwiftUI

@main
struct iOS_noviceApp: App {
    // Android でいうなら Activityのような存在
    // まずmodel data を読み込み、画面の生成( ContentView )を行う
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
