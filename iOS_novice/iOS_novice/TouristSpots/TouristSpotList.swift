import SwiftUI

struct TouristSpotList: View {
    let spots: [TouristSpot]

    var body: some View {
        List(spots) { spot in
            VStack(alignment: .leading) {
                Text(spot.name)
                    .font(.headline)
                Text(spot.description)
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    TouristSpotList(spots: touristSpots)
}

