//
//  appLanguage.swift
//  iOS_novice
//
//  Created on 2024/07/17.
//

import Foundation

func getAppLanguage() -> String {
    /** 端末の言語を読み込んで言語を決定する
     * デフォルトとして英語を設定している
     */
    let language = Locale(identifier: Locale.preferredLanguages.first ?? "en").language.languageCode
    let fileLanguage = switch(language) {
    case "ja" :"landmarkDataJa.json"
    case "id" :"landmarkDataId.json"
    default : "landmarkData.json"
    }
    return fileLanguage
}
