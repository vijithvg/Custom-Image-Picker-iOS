//
//  ImagePickerManager.swift
//  Custom Image Picker
//
//  Created by Vijith V G on 18/11/26.
//


import Photos
import UIKit

public final class ImagePickerManager: Sendable {
    public static let shared = ImagePickerManager()
    
    private init() {}
    
    // Converted to async/await
    public func requestPermission() async -> Bool {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)
        
        switch status {
        case .authorized, .limited:
            return true
        case .notDetermined:
            // Apple's requestAuthorization now supports async/await natively
            let newStatus = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
            return newStatus == .authorized || newStatus == .limited
        default:
            return false
        }
    }
    
    public func fetchAllPhotos() -> [PHAsset] {
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let fetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        var assets = [PHAsset]()
        
        fetchResult.enumerateObjects { (asset, _, _) in
            assets.append(asset)
        }
        
        return assets
    }
    
    // Bridged completion handler to async/await using Continuation
    public func resolveImage(for asset: PHAsset, targetSize: CGSize) async -> UIImage? {
        let options = PHImageRequestOptions()
        options.deliveryMode = .highQualityFormat
        options.isNetworkAccessAllowed = true
        
        return await withCheckedContinuation { continuation in
            PHImageManager.default().requestImage(for: asset, targetSize: targetSize, contentMode: .aspectFill, options: options) { image, _ in
                continuation.resume(returning: image)
            }
        }
    }
}
