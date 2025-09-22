# Implementation Plan

- [ ] 1. Create SwiftData models for internal landmark storage
  - Create LandmarkEntity SwiftData model with all landmark properties
  - Create LandmarkLocalization SwiftData model for multi-language support
  - Create MigrationStatus SwiftData model to track migration completion
  - Add proper relationships between entities and configure delete rules
  - Write unit tests for model initialization and relationships
  - _Requirements: 2.2, 2.3, 4.3_

- [ ] 2. Implement repository pattern for data access abstraction
  - Create LandmarkRepository protocol defining data access interface
  - Implement SwiftDataLandmarkRepository with ModelContext integration
  - Add methods for CRUD operations (create, read, update, delete landmarks)
  - Implement language-aware data retrieval for localized content
  - Write unit tests for repository operations with mock ModelContext
  - _Requirements: 4.2, 4.3_

- [ ] 3. Create data migration service for JSON-to-SwiftData conversion
  - Implement DataMigrationService class with JSON loading capabilities
  - Add methods to convert existing Landmark structs to SwiftData entities
  - Create migration logic that preserves all landmark properties and relationships
  - Implement migration status tracking to prevent duplicate migrations
  - Add error handling for migration failures with detailed logging
  - Write unit tests for migration accuracy and error scenarios
  - _Requirements: 2.1, 2.2, 2.3, 2.4_

- [ ] 4. Update Landmark struct to work with SwiftData entities
  - Add initializer to create Landmark from LandmarkEntity and LandmarkLocalization
  - Maintain existing Landmark struct interface for UI compatibility
  - Ensure all existing properties (coordinates, image, etc.) work correctly
  - Add helper methods for entity conversion if needed
  - Write unit tests for struct-entity conversion accuracy
  - _Requirements: 3.1, 3.2, 3.3_

- [ ] 5. Implement error handling and fallback mechanisms
  - Create LandmarkDataError enum with specific error types
  - Implement fallback to JSON loading when SwiftData fails
  - Add graceful error handling in repository operations
  - Create user-friendly error messages for different failure scenarios
  - Write unit tests for error handling and fallback behavior
  - _Requirements: 5.1, 5.2, 5.3, 5.4_

- [ ] 6. Update ModelData class to use repository pattern
  - Refactor ModelData to accept LandmarkRepository dependency
  - Replace direct JSON loading with repository-based data access
  - Add async data loading methods with proper error handling
  - Implement loading states and error state management
  - Maintain @Observable behavior for SwiftUI integration
  - Write unit tests for ModelData with mock repository
  - _Requirements: 1.1, 1.2, 4.2, 4.3_

- [ ] 7. Configure SwiftData container and app initialization
  - Update iOS_noviceApp.swift to configure SwiftData ModelContainer
  - Add all SwiftData models to the container configuration
  - Initialize migration service and trigger migration on app launch
  - Set up ModelData with SwiftDataLandmarkRepository
  - Add proper error handling for SwiftData initialization failures
  - _Requirements: 1.1, 2.1, 2.4_

- [ ] 8. Update views to handle async data loading
  - Modify LandmarkList to work with async data loading from ModelData
  - Add loading indicators and error states to the UI
  - Update favorite toggle functionality to work with repository
  - Ensure search and filtering continue to work with new data source
  - Test that all existing UI functionality remains intact
  - _Requirements: 3.1, 3.2, 3.3, 3.4_

- [ ] 9. Implement comprehensive testing for the new data layer
  - Create integration tests for complete data flow from SwiftData to UI
  - Test migration process with actual JSON files
  - Verify multi-language support works correctly with SwiftData
  - Test favorite persistence across app launches
  - Add performance tests to ensure data loading meets or exceeds JSON performance
  - _Requirements: 1.2, 2.3, 3.4_

- [ ] 10. Add data validation and integrity checks
  - Implement data validation in SwiftData models
  - Add integrity checks for landmark data consistency
  - Create data repair mechanisms for corrupted data
  - Add logging for data operations and migration status
  - Write tests for data validation and repair functionality
  - _Requirements: 4.4, 5.3_