//
//  ContentView.swift
//  CustomPickerExample
//
//  Created by Vijith V G on 18/11/26.
//

import SwiftUI
import Custom_Image_Picker // Use your exact framework name

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
                    .padding()
            } else {
                Text("No image selected")
                    .foregroundColor(.gray)
                    .padding()
            }
            
            // Call the public view from your framework
            CustomImagePickerView { image in
                self.selectedImage = image
            }
        }
    }
}

#Preview {
    ContentView()
}
