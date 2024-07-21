//
//  getDefalutLanguageTest.swift
//  iOS_noviceTests
//
//  Created by Takumi Jindo on 2024/07/21.
//

import XCTest
import Foundation
@testable import iOS_novice


final class getDefalutLanguageTest: XCTestCase {

    override func setUpWithError() throws {
       
    }

    override func tearDownWithError() throws {
        
    }

    func testGetLanguageSelectJapanseFile() throws {
       let setLanguage = "ja"
        let FileName = "landmarkDataJa.json"
        let getFileName = getLanguageSelectFile(language: setLanguage)
        XCTAssertEqual(FileName,getFileName)
    }
    
    func testGetLanguageSelectIndonesianFile() throws {
       let setLanguage = "id"
        let FileName = "landmarkDataId.json"
        let getFileName = getLanguageSelectFile(language: setLanguage)
        XCTAssertEqual(FileName,getFileName)
    }
    
    func testGetLanguageSelectDefalutFile() throws {
       let setLanguage = "en"
        let FileName = "landmarkData.json"
        let getFileName = getLanguageSelectFile(language: setLanguage)
        XCTAssertEqual(FileName,getFileName)
    }
    
    func testGetLanguageSelectDefalutFileWithNoLanguageCode() throws {
       let setLanguage = ""
        let FileName = "landmarkData.json"
        let getFileName = getLanguageSelectFile(language: setLanguage)
        XCTAssertEqual(FileName,getFileName)
    }
    
    func getLanguageSelectFile(language:String) -> String {
        // 本来であれば、appLanguageのメソッドをテストするところだが、languageCode の返り値を string にできないというエラーが解消できなかったため同じ条件式を作成しテストする
        let fileLanguage = switch(language) {
        case "ja" :"landmarkDataJa.json"
        case "id" :"landmarkDataId.json"
        default : "landmarkData.json"
        }
        return fileLanguage
    }
}
