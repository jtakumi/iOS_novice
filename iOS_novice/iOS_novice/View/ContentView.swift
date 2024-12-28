//
//  ContentView.swift
//  iOS_novice
//
//
//リスト画面を表示するコード

import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    var body: some View {
    LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
