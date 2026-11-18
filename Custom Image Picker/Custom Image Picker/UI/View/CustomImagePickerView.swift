//
//  CustomImagePickerView.swift
//  Custom Image Picker
//
//  Created by Vijith V G on 18/11/26.
//


import SwiftUI
import Photos

public struct CustomImagePickerView: View {
    @StateObject private var viewModel = ImagePickerViewModel()
    public var onImageSelected: ((UIImage) -> Void)?
    
    let columns = [
        GridItem(.adaptive(minimum: 100), spacing: 2)
    ]
    
    public init(onImageSelected: ((UIImage) -> Void)? = nil) {
        self.onImageSelected = onImageSelected
    }
    
    public var body: some View {
        Group {
            if viewModel.permissionGranted {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 2) {
                        ForEach(viewModel.assets, id: \.localIdentifier) { asset in
                            ImageCell(asset: asset, viewModel: viewModel)
                                .aspectRatio(1, contentMode: .fill)
                                .clipped()
                                .onTapGesture {
                                    // Use a Task to await the high-res image download on tap
                                    Task {
                                        if let selectedImage = await viewModel.fetchImage(for: asset, targetSize: PHImageManagerMaximumSize) {
                                            onImageSelected?(selectedImage)
                                        }
                                    }
                                }
                        }
                    }
                }
            } else {
                VStack {
                    Text("Photo access is required.")
                    Button("Grant Permission") {
                        viewModel.requestPermissionsAndFetch()
                    }
                }
            }
        }
        .task { // Replaces .onAppear
            viewModel.requestPermissionsAndFetch()
        }
    }
}


