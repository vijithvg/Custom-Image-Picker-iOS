//
//  ImageCell.swift
//  Custom Image Picker
//
//  Created by Vijith V G on 18/11/26.
//

import SwiftUI
import Photos

struct ImageCell: View {
    let asset: PHAsset
    @ObservedObject var viewModel: ImagePickerViewModel
    @State private var image: UIImage?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width, height: geometry.size.height)
                } else {
                    Color.gray.opacity(0.3)
                        .task { // Replaces .onAppear, handles cancellation automatically
                            let size = CGSize(width: geometry.size.width * 2, height: geometry.size.height * 2)
                            self.image = await viewModel.fetchImage(for: asset, targetSize: size)
                        }
                }
            }
        }
    }
}
