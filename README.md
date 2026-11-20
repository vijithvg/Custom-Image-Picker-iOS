# Custom Image Picker

A modern, lightweight iOS framework for fetching and selecting photos from the user's device. Built entirely from scratch using Apple's Photos framework, this library leverages modern Swift concurrency (`async`/`await`) and provides native support for both SwiftUI and UIKit.

## Features

* **Swift Package Manager Support:** Install directly in Xcode with zero manual framework linking.
* **Modern Concurrency:** Uses `async`/`await` and continuations for performant, non-blocking image fetching and state management.
* **SwiftUI First:** Native `CustomImagePickerView` for seamless integration into declarative UIs.
* **UIKit Interoperability:** Includes a `CustomImagePickerViewController` wrapper for UIKit codebases.
* **Automated Build Pipeline:** Easy `.xcframework` generation via Xcode Aggregate Targets (no terminal required).
* **Modern Swift Testing:** Built-in unit tests utilizing Apple's Swift Testing macro framework (`@Suite`, `@Test`).

## Requirements

* iOS 15.0+
* Xcode 16.0+ (for Swift Testing)
* Swift 5.5+

## Installation

### Swift Package Manager (Recommended)

1. In Xcode, open **File → Add Package Dependencies...**
2. Enter the repository URL:
   ```text
   [https://github.com/vijithvg/Custom-Image-Picker-iOS.git](https://github.com/vijithvg/Custom-Image-Picker-iOS.git)
   ```

### Manual (.xcframework)
1.Build the framework using the Build XCFramework scheme in Xcode.
2.Drag and drop the generated Custom_Image_Picker.xcframework into your project's Frameworks, Libraries, and Embedded Content section.
3.Ensure the embed option is set to Embed & Sign.
(Note: If you installed via the manual .xcframework instead of SPM, use import Custom_Image_Picker.)

## Configuration
You must declare why your app needs photo library access. Add the following key to your host app's Info.plist:

Key: Privacy - Photo Library Usage Description (NSPhotoLibraryUsageDescription)
Value: "Required to select photos for the app."

SWIFTUI

```
import SwiftUI
import CustomImagePicker

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

UIKIT

```
import UIKit
import CustomImagePicker

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

