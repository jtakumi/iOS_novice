import Foundation

@Observable
class TouristSpotStore {
    var spots: [TouristSpot] = load(getAppLanguage())
}

