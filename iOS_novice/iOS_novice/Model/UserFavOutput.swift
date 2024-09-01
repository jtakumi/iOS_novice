//
//  UserFavOutput.swift
//  iOS_novice
//
//

import Foundation

// 星アイコンがタップされたら観光地ID と お気に入りフラグを JSON ファイルとして書き出す
func UserFavOutput(landmarkId:Int,isFavorite:Bool){
  if let outputData = "{id : \(landmarkId), \n isFavorite: \(isFavorite)}".data(using: .utf8),
     let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
      let outputFileName = documentDirectory.appendingPathComponent("UserFavOutput.json")
        do{
            try outputData.write(to: outputFileName)
        } catch{
            fatalError("Couldn't write \(outputData) to \(outputFileName) .")
        }
  } else {
      print("outputData couldn't convert to json file.")
  }
}
