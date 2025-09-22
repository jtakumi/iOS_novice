# Project Structure

## Root Directory Layout

```
iOS_novice/
├── iOS_novice/                 # Main app target
├── iOS_noviceTests/           # Unit tests
├── iOS_noviceUITests/         # UI tests
└── iOS_novice.xcodeproj/      # Xcode project files
```

## Main App Structure (`iOS_novice/iOS_novice/`)

### Core Files
- `iOS_noviceApp.swift` - App entry point with ModelData environment setup
- `View/ContentView.swift` - Root view that displays LandmarkList

### Feature Modules

#### `/Landmarks/` - Main feature implementation
- `LandmarkList.swift` - Master list with filtering and search
- `LandmarkDetail.swift` - Detail view with map and favorite button
- `LandmarkRow.swift` - List item component with Liquid Glass effect
- `appLanguage.swift` - Language detection logic
- `Localizable.xcstrings` - String catalog for localization

#### `/Model/` - Data layer
- `Landmark.swift` - Core landmark model (Codable, Identifiable)
- `ModelData.swift` - Data manager with @Observable pattern
- `IsFavorite.swift` - SwiftData model for favorites persistence
- `UserFavOutput.swift` - File output utilities

#### `/Helpers/` - Reusable components
- `CircleImage.swift` - Circular image component
- `FavoriteButton.swift` - Animated favorite toggle button
- `MapView.swift` - MapKit wrapper component
- `LiquidGlassEffect.swift` - iOS 18 visual effects with fallbacks
- `ToastMessage.swift` - Toast notification component
- `getDefalutLanguageProvidor.swift` - Language provider utilities

#### `/Resources/` - Static data
- `landmarkData.json` - English landmark data
- `landmarkDataJa.json` - Japanese translations
- `landmarkDataId.json` - Indonesian translations
- Additional locale-specific JSON files

#### `/Assets.xcassets/` - Visual assets
- App icons, landmark images, and color sets
- Organized by feature (landmarks, UI elements)

## Naming Conventions

- **Files**: PascalCase for Swift files (`LandmarkList.swift`)
- **Classes/Structs**: PascalCase (`LandmarkDetail`)
- **Variables/Functions**: camelCase (`showFavoritesOnly`)
- **Constants**: camelCase or UPPER_CASE for static values
- **JSON Files**: camelCase with descriptive suffixes (`landmarkDataJa.json`)

## Code Organization Principles

- **Feature-based grouping**: Related functionality grouped in folders
- **Separation of concerns**: Models, Views, and Helpers clearly separated
- **Reusable components**: Common UI elements in Helpers folder
- **Localization**: Centralized string management with .xcstrings
- **Resource management**: Static data and assets properly organized