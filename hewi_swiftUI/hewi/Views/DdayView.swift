//
//  DdayView.swift
//  hewi
//
//  Created by 조민서 on 2021/04/01.
//

import SwiftUI

struct DdayView : View {
    
    @State var isShowingImagePicker = false
    @State var imageInBlackBox = UIImage()
    
    var body: some View {
        VStack() {
            
            Image(uiImage: imageInBlackBox)
                .resizable()
                .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                    .border(Color.black, width: 1)
                    .clipped()
            
            Button(action: {
                self.isShowingImagePicker.toggle()
            }, label: {
                Text("Select Image")
                    .font(.system(size: 24))
            })
            .sheet(isPresented: $isShowingImagePicker, content: {
                ImagePickerView(isPresented: self.$isShowingImagePicker, selectedImage: self.$imageInBlackBox)
            })
            
        }
        .navigationBarTitle("D-DAY", displayMode: .inline)
    }
}

struct ImagePickerView : UIViewControllerRepresentable {
    
    @Binding var isPresented : Bool
    @Binding var selectedImage : UIImage
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePickerView>) -> UIViewController {
        let controller = UIImagePickerController()
        controller.delegate = context.coordinator
        return controller
    }
    
    func makeCoordinator() -> ImagePickerView.Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent : ImagePickerView
        
        init(parent: ImagePickerView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let selectedImageFromPicker = info[.originalImage] as? UIImage {
                print(selectedImageFromPicker)
                self.parent.selectedImage = selectedImageFromPicker
            }
            
            self.parent.isPresented = false
        }
    }
    
    func updateUIViewController(_ uiViewController: ImagePickerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePickerView>) {
        
    }
}

struct DummyView : UIViewRepresentable {
    
    func makeUIView(context: UIViewRepresentableContext<DummyView>) -> UIButton {
        let button = UIButton()
        button.setTitle("Dummy", for: .normal)
        button.backgroundColor = .red
        return button
    }
    
    func updateUIView(_ uiView: DummyView.UIViewType, context: UIViewRepresentableContext<DummyView>) {
        
    }
}
