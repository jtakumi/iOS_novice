# Design Document

## Overview

This design outlines the migration from JSON-based landmark data loading to a SwiftData-based internal data management system. The solution maintains backward compatibility while providing a foundation for future data management features. The design preserves all existing functionality including multi-language support, favorites management, and the current UI experience.

## Architecture

### Current Architecture
- JSON files store landmark data for each language (landmarkData.json, landmarkDataJa.json, landmarkDataId.json)
- ModelData class loads JSON based on device language using getAppLanguage()
- Landmark struct implements Codable for JSON parsing
- Separate SwiftData model (IsFavorite) manages favorite status

### New Architecture
- SwiftData models store all landmark data internally
- Repository pattern abstracts data access from UI components
- Migration service handles one-time JSON-to-SwiftData conversion
- Localization handled through SwiftData relationships
- Unified data model eliminates separate favorite tracking

## Components and Interfaces

### 1. SwiftData Models

#### LandmarkEntity
```swift
@Model
class LandmarkEntity {
    @Attribute(.unique) var id: Int
    var imageName: String
    var latitude: Double
    var longitude: Double
    var category: String
    var city: String
    var state: String
    var park: String
    var isFeatured: Bool
    var isFavorite: Bool
    
    // Relationship to localized content
    @Relationship(deleteRule: .cascade) var localizations: [LandmarkLocalization]
    
    init(id: Int, imageName: String, latitude: Double, longitude: Double, 
         category: String, city: String, state: String, park: String, 
         isFeatured: Bool, isFavorite: Bool = false) {
        // Initialize properties
    }
}
```

#### LandmarkLocalization
```swift
@Model
class LandmarkLocalization {
    var languageCode: String
    var name: String
    var description: String
    var localizedCategory: String
    var localizedCity: String
    var localizedState: String
    var localizedPark: String
    
    @Relationship(inverse: \LandmarkEntity.localizations) 
    var landmark: LandmarkEntity?
    
    init(languageCode: String, name: String, description: String, 
         localizedCategory: String, localizedCity: String, 
         localizedState: String, localizedPark: String) {
        // Initialize properties
    }
}
```

### 2. Repository Layer

#### LandmarkRepository Protocol
```swift
protocol LandmarkRepository {
    func getAllLandmarks() async throws -> [Landmark]
    func getLandmark(by id: Int) async throws -> Landmark?
    func updateFavoriteStatus(landmarkId: Int, isFavorite: Bool) async throws
    func searchLandmarks(query: String) async throws -> [Landmark]
}
```

#### SwiftDataLandmarkRepository
```swift
@Observable
class SwiftDataLandmarkRepository: LandmarkRepository {
    private let modelContext: ModelContext
    private let currentLanguage: String
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        self.currentLanguage = getCurrentLanguageCode()
    }
    
    // Implementation of repository methods
}
```

### 3. Migration Service

#### DataMigrationService
```swift
class DataMigrationService {
    private let modelContext: ModelContext
    
    func migrateFromJSONIfNeeded() async throws {
        // Check if migration is needed
        // Load JSON files for all languages
        // Convert to SwiftData entities
        // Save to persistent store
        // Mark migration as complete
    }
    
    private func loadJSONData(for language: String) throws -> [Landmark] {
        // Load and decode JSON data
    }
    
    private func convertToEntities(_ landmarks: [Landmark], language: String) -> [LandmarkEntity] {
        // Convert Landmark structs to SwiftData entities
    }
}
```

### 4. Updated ModelData

#### Enhanced ModelData Class
```swift
@Observable
class ModelData {
    private let repository: LandmarkRepository
    var landmarks: [Landmark] = []
    var isLoading: Bool = false
    var errorMessage: String?
    
    init(repository: LandmarkRepository) {
        self.repository = repository
    }
    
    func loadLandmarks() async {
        // Load landmarks using repository
    }
    
    func toggleFavorite(landmark: Landmark) async {
        // Update favorite status through repository
    }
}
```

## Data Models

### Landmark Struct (Updated)
The existing Landmark struct will be updated to work with SwiftData entities while maintaining compatibility:

```swift
struct Landmark: Hashable, Identifiable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    let imageName: String
    let category: String
    let city: String
    let isFeatured: Bool
    var isFavorite: Bool
    
    private let coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    var image: Image {
        Image(imageName)
    }
    
    struct Coordinates: Hashable {
        let latitude: Double
        let longitude: Double
    }
    
    // Initializer from SwiftData entity
    init(from entity: LandmarkEntity, localization: LandmarkLocalization) {
        // Convert entity to struct
    }
}
```

### Migration Data Model
```swift
@Model
class MigrationStatus {
    @Attribute(.unique) var key: String
    var isCompleted: Bool
    var completedAt: Date?
    
    init(key: String, isCompleted: Bool = false) {
        self.key = key
        self.isCompleted = isCompleted
    }
}
```

## Error Handling

### Error Types
```swift
enum LandmarkDataError: Error, LocalizedError {
    case migrationFailed(String)
    case dataCorruption
    case networkUnavailable
    case storageUnavailable
    
    var errorDescription: String? {
        switch self {
        case .migrationFailed(let reason):
            return "Migration failed: \(reason)"
        case .dataCorruption:
            return "Data corruption detected"
        case .networkUnavailable:
            return "Network unavailable"
        case .storageUnavailable:
            return "Storage unavailable"
        }
    }
}
```

### Fallback Strategy
1. **Primary**: SwiftData repository
2. **Fallback 1**: JSON file loading (existing system)
3. **Fallback 2**: Hardcoded minimal dataset
4. **Error State**: User-friendly error message with retry option

## Testing Strategy

### Unit Tests
- **Repository Tests**: Mock ModelContext to test data operations
- **Migration Tests**: Test JSON-to-SwiftData conversion accuracy
- **Model Tests**: Verify entity relationships and data integrity
- **Error Handling Tests**: Test fallback mechanisms and error scenarios

### Integration Tests
- **End-to-End Data Flow**: Test complete data loading pipeline
- **Language Switching**: Verify localization works correctly
- **Favorites Persistence**: Test favorite status across app launches
- **Migration Process**: Test complete migration from JSON to SwiftData

### UI Tests
- **Landmark List**: Verify landmarks display correctly after migration
- **Detail View**: Test all landmark information displays properly
- **Search and Filter**: Ensure search functionality works with new data layer
- **Favorites Toggle**: Test favorite button functionality

## Implementation Phases

### Phase 1: SwiftData Models and Repository
- Create LandmarkEntity and LandmarkLocalization models
- Implement LandmarkRepository protocol and SwiftDataLandmarkRepository
- Add basic CRUD operations

### Phase 2: Migration Service
- Implement DataMigrationService
- Add migration status tracking
- Test JSON-to-SwiftData conversion

### Phase 3: ModelData Integration
- Update ModelData to use repository pattern
- Implement error handling and fallback mechanisms
- Update app initialization to trigger migration

### Phase 4: UI Layer Updates
- Update views to work with async data loading
- Add loading states and error handling UI
- Test all existing functionality

### Phase 5: Cleanup and Optimization
- Remove dependency on JSON files (optional)
- Optimize data queries for performance
- Add data validation and integrity checks