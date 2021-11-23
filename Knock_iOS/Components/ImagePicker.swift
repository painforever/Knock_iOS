//
//  ImagePicker.swift
//  Knock_iOS
//
//  Created by yusong on 11/22/21.
//

//Credit: https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-uiimagepickercontroller
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    @Binding var imageName: String

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage, let imageName = info[.imageURL] as? URL {
                parent.imageName = imageName.lastPathComponent
                parent.image     = uiImage
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
