//
//  CustomImagePickerViewController.swift
//  Custom Image Picker
//
//  Created by Vijith V G on 18/11/26.
//


import SwiftUI
import UIKit

public class CustomImagePickerViewController: UIHostingController<CustomImagePickerView> {
    
    public init(onImageSelected: @escaping (UIImage) -> Void) {
        let pickerView = CustomImagePickerView(onImageSelected: onImageSelected)
        super.init(rootView: pickerView)
    }
    
    @MainActor required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}