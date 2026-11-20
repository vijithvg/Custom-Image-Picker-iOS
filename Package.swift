//
//  Package.swift
//  Custom Image Picker
//
//  Created by Vijith V G on 20/11/26.
//

// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CustomImagePicker",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "CustomImagePicker",
            targets: ["CustomImagePicker"]
        ),
    ],
    targets: [
        .target(
            name: "CustomImagePicker",
            path: "Custom Image Picker/Custom Image Picker" // Match your exact folder name on disk
        )
//        .testTarget(
//            name: "CustomImagePickerTests",
//            dependencies: ["CustomImagePicker"],
//            path: "Custom Image PickerTests" // Match your exact test folder name on disk
//        ),
    ]
)
