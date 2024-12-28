//
//  ModelData.swift
//  iOS_novice
//
//  JSON ファイルを探し出して読み込み、decode するコード
// ModelData として機能する

import Foundation

@Observable
class ModelData{
    var landmarks:[Landmark] = load(getAppLanguage())
}

func load<T:Decodable>(_ filename:String) -> T {
    let data:Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension:nil)
            //ファイルが見つからない時のエラー
    else{
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    } catch {
        //ファイルは見つかったものの、何らかの原因でファイルを読み込めなかった時
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self,from:data)
    
    } catch {
        //decode できなかった時
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}
