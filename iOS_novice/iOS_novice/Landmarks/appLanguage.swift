//
//  appLanguage.swift
//  iOS_novice
//
//  Created on 2024/07/17.
//

import Foundation

func getAppLanguage() -> String {
    let language = Locale(identifier: Locale.preferredLanguages[0]).language.languageCode
    let fileLanguage = switch(language) {
    case "ja" :"landmarkDataJa.json"
    case "id" :"landmarkDataId.json"
    default : "landmarkData.json"
    }
    return fileLanguage
}
