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
            path: "CustomImagePicker",
            exclude: [
                "CustomImagePicker.h" // Exclude the Xcode umbrella header
            ]
        ),
        .testTarget(
            name: "CustomImagePickerTests",
            dependencies: ["CustomImagePicker"],
            path: "CustomImagePickerTests"
        ),
    ]
)
