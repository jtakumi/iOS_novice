import SwiftUI

struct TouristSpotList: View {
    @Environment(TouristSpotStore.self) private var store

    var body: some View {
        List(store.spots) { spot in
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
    TouristSpotList()
        .environment(TouristSpotStore())
}

