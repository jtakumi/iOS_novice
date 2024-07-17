//
//  appLanguage.swift
//  iOS_novice
//
//  Created on 2024/07/17.
//

import Foundation

func getAppLanguage() -> String {
    let language = Locale(identifier: Locale.preferredLanguages[0])
    print(language.language.languageCode ?? "Couldn't get language code.")
    let fileLanguage = switch(language.language.languageCode) {
    case .some("ja") :"landmarkDataJa.json"
    case .some("id") :"landmarkDataId.json"
    case .none :"landmarkData.json"
    default : "landmarkData.json"
    }
    return fileLanguage
}
