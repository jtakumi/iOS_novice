# Technology Stack

## Core Technologies

- **Framework**: SwiftUI (iOS 15+)
- **Language**: Swift 5.9+
- **Data Persistence**: SwiftData for favorites management
- **Maps**: MapKit for location display
- **Localization**: String Catalogs (.xcstrings)
- **Build System**: Xcode project with standard iOS app structure

## Key Dependencies

- **Foundation**: Core Swift framework
- **SwiftUI**: Declarative UI framework
- **SwiftData**: Modern data persistence (@Observable pattern)
- **CoreLocation**: Location services and coordinate handling
- **MapKit**: Interactive map components

## iOS Version Support

- **Minimum**: iOS 15.0
- **Target**: iOS 18.0 (for Liquid Glass effects)
- **Deployment**: Universal iOS app

## Build Commands

### Development
```bash
# Open project in Xcode
open iOS_novice.xcodeproj

# Build from command line
xcodebuild -project iOS_novice.xcodeproj -scheme iOS_novice -destination 'platform=iOS Simulator,name=iPhone 15' build

# Run tests
xcodebuild test -project iOS_novice.xcodeproj -scheme iOS_novice -destination 'platform=iOS Simulator,name=iPhone 15'
```

### Testing
- Unit tests located in `iOS_noviceTests/`
- UI tests in `iOS_noviceUITests/`
- Test target: `iOS_noviceTests`

## Architecture Patterns

- **MVVM**: Model-View-ViewModel with @Observable
- **Data Flow**: Unidirectional with SwiftUI's state management
- **Dependency Injection**: Environment-based dependency passing
- **Repository Pattern**: JSON data loading with ModelData class

## Code Organization

- Models use Codable for JSON parsing
- Views follow SwiftUI declarative patterns
- Helpers contain reusable UI components
- Resources store JSON data and assets