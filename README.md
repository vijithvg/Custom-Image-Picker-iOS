# Custom-Image-Picker-iOS
A modern, lightweight iOS framework for fetching and selecting photos from the user's device. Built entirely from scratch using Apple's Photos framework, this library leverages modern Swift concurrency (async/await) and provides native support for both SwiftUI and UIKit.

## Features
Modern Concurrency: Uses async/await and continuations for performant, non-blocking image fetching and state management.

SwiftUI First: Native CustomImagePickerView for seamless integration into declarative UIs.

UIKit Interoperability: Includes a CustomImagePickerViewController wrapper for UIKit codebases.

Automated Build Pipeline: Easy .xcframework generation via Xcode Aggregate Targets (no terminal required).

Modern Swift Testing: Built-in unit tests utilizing Apple's new Swift Testing macro framework (@Suite, @Test).

## Requirements
iOS 17.0+

Swift 5.5+

## Installation
Build the framework using the Build XCFramework scheme in Xcode.

Drag and drop the generated Custom_Image_Picker.xcframework into your project's Frameworks, Libraries, and Embedded Content section.

Ensure the embed option is set to Embed & Sign.

## Configuration
You must declare why your app needs photo library access. Add the following key to your host app's Info.plist:

Key: Privacy - Photo Library Usage Description (NSPhotoLibraryUsageDescription)

Value: "Required to select photos for the app."

## Usage


SwiftUI

```swift
import SwiftUI
import Custom_Image_Picker

struct ContentView: View {

    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300)
                    .cornerRadius(12)
            }
            
            CustomImagePickerView { image in
                self.selectedImage = image
            }
        }
    }
}
```

UIKit

```swift
import UIKit
import Custom_Image_Picker

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerVC = CustomImagePickerViewController { [weak self] image in
            print("Image selected: \(image)")
            self?.dismiss(animated: true)
        }
        
        present(pickerVC, animated: true)
    }
}
```
