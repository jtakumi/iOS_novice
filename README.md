# iOS_novice

iOS_novice is a practice SwiftUI application that displays a list of tourist
landmarks and lets you manage favorites. The project follows Apple's Landmarks
tutorial but adds small experiments for learning Swift and SwiftUI.

## Features

- **Landmark browser** – loads landmark data from local JSON and shows it in a
  navigable list. A toggle lets you limit the list to favorites only.
- **Detail screen** – shows a map, circular image, and description for each
  landmark. You can mark a landmark as a favorite and the app will write that
  state to a JSON file.
- **Localization** – determines the device language at launch and chooses the
  corresponding data file (`landmarkData.json`, `landmarkDataJa.json`,
  `landmarkDataId.json`).

## Project structure

```
├─ iOS_novice/          # Application source
│  ├─ Model/            # Landmark model, data loading, favorites output
│  ├─ Landmarks/        # Landmark list, detail screen, and language helper
│  └─ Helpers/          # Reusable views (MapView, CircleImage, FavoriteButton)
├─ iOS_noviceTests/     # Example unit tests
└─ iOS_noviceUITests/   # Placeholder UI tests
```

## Running

1. Open `iOS_novice.xcodeproj` in Xcode 15 or later.
2. Select an iOS 17+ simulator or a connected device.
3. Build and run the app.

## Testing

The repository includes basic unit tests that can be executed from Xcode's Test
navigator (`⌘U`). Command line builds (`swift test`) are not configured.

