//
//  ImagePickerViewModel.swift
//  Custom Image Picker
//
//  Created by Vijith V G on 18/11/26.
//


import SwiftUI
import Photos
import Combine

@MainActor
public class ImagePickerViewModel: ObservableObject {
    @Published public var assets: [PHAsset] = []
    @Published public var permissionGranted: Bool = false
    
    public init() {}
    
    public func requestPermissionsAndFetch() {
        // Spin up an async Task to await the result
        Task {
            let granted = await ImagePickerManager.shared.requestPermission()
            self.permissionGranted = granted
            
            if granted {
                self.assets = ImagePickerManager.shared.fetchAllPhotos()
            }
        }
    }
    
    public func fetchImage(for asset: PHAsset, targetSize: CGSize) async -> UIImage? {
        return await ImagePickerManager.shared.resolveImage(for: asset, targetSize: targetSize)
    }
}
