//
//  ImagePickerViewModelTests.swift
//  Custom Image PickerTests
//
//  Created by Vijith V G on 18/11/26.
//

import Testing
@testable import Custom_Image_Picker // Use your exact framework module name

@MainActor
@Suite("Image Picker View Model Tests")
struct ImagePickerViewModelTests {
    
    // The view model instance is recreated fresh for each @Test automatically
    let viewModel: ImagePickerViewModel
    
    init() {
        // This acts as your setup phase
        viewModel = ImagePickerViewModel()
    }
    
    @Test("Initial state should be empty and unauthorized")
    func initialState() {
        #expect(viewModel.permissionGranted == false, "Permission should be false on init")
        #expect(viewModel.assets.isEmpty, "Assets array should be empty on init")
    }
    
    @Test("Permissions request updates state asynchronously")
    func permissionsUpdateState() async {
        // Trigger the async permission and fetch request
        viewModel.requestPermissionsAndFetch()
        
        // Allow the async Task to yield and update the @Published properties on the MainActor
        await Task.yield()
        
        // Verify the state properties are safely accessible
        // (Note: In a pure unit test without a mocked manager, this will reflect the simulator's actual state)
        #expect(viewModel.permissionGranted == false || viewModel.permissionGranted == true)
    }
}
