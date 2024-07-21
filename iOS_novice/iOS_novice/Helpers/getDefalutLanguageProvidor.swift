//
//  getDefalutLanguageProvidor.swift
//  iOS_novice
//
//  Created on 2024/07/21.
//

import Foundation

protocol LocaleProvider {
    var preferredLanguageCode: String { get }
}

class DefaultLocaleProvider: LocaleProvider {
    var preferredLanguageCode: String {
        return Locale(identifier: Locale.preferredLanguages[0]).language.languageCode
    }
}
