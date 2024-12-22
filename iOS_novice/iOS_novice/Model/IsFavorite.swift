import Foundation
import SwiftData

@Model
class IsFavorite {
    var id: Int
    var isFavorite: Bool

    init(id:Int, isFavorite:Bool){
        self.id = id
        self.isFavorite = isFavorite
    }
}
